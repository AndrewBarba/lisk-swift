//
//  LocalTransaction.swift
//  Lisk
//
//  Created by Andrew Barba on 1/7/18.
//

import Foundation
import Ed25519

public struct LocalTransaction: Encodable {

    public let type: TransactionType

    public let amount: UInt64

    public let fee: UInt64

    public let recipientId: String?

    public let timestamp: UInt32

    public private(set) var id: String?

    public private(set) var senderPublicKey: String?

    public private(set) var signature: String?

    public private(set) var signSignature: String?

    public var isSigned: Bool {
        return id != nil && senderPublicKey != nil && signature != nil
    }

    public init(_ type: TransactionType, amount: UInt64, recipientId: String? = nil, timestamp: UInt32? = nil) {
        self.type = type
        self.amount = amount
        self.fee = LocalTransaction.transactionFee(type: type)
        self.recipientId = recipientId
        self.timestamp = timestamp ?? Crypto.timeIntervalSinceGenesis()
        self.id = nil
        self.senderPublicKey = nil
        self.signature = nil
        self.signSignature = nil
    }

    public init(_ type: TransactionType, lsk: Double, recipientId: String? = nil, timestamp: UInt32? = nil) {
        let amount = Crypto.fixedPoint(amount: lsk)
        self.init(type, amount: amount, recipientId: recipientId, timestamp: timestamp)
    }

    public init(transaction: LocalTransaction) {
        self.type = transaction.type
        self.amount = transaction.amount
        self.fee = transaction.fee
        self.recipientId = transaction.recipientId
        self.senderPublicKey = transaction.senderPublicKey
        self.timestamp = transaction.timestamp
        self.id = transaction.id
        self.signature = transaction.signature
        self.signSignature = transaction.signSignature
    }

    public func signed(secret: String, secondSecret: String? = nil) throws -> LocalTransaction {
        var transaction = LocalTransaction(transaction: self)
        let keyPair = try Crypto.keyPair(fromSecret: secret)
        transaction.senderPublicKey = keyPair.publicKeyString
        transaction.signature = LocalTransaction.generateSignature(bytes: transaction.bytes, keyPair: keyPair)
        if let secondSecret = secondSecret, transaction.type != .registerSecondPassphrase {
            let secondKeyPair = try Crypto.keyPair(fromSecret: secondSecret)
            transaction.signSignature = LocalTransaction.generateSignature(bytes: transaction.bytes, keyPair: secondKeyPair)
        }
        transaction.id = LocalTransaction.generateId(bytes: transaction.bytes)
        return transaction
    }

    public mutating func sign(secret: String, secondSecret: String? = nil) throws {
        let transaction = try signed(secret: secret, secondSecret: secondSecret)
        self.id = transaction.id
        self.senderPublicKey = transaction.senderPublicKey
        self.signature = transaction.signature
        self.signSignature = transaction.signSignature
    }

    private static func generateId(bytes: [Byte]) -> String {
        let hash = SHA256(bytes).digest()
        let id = Crypto.byteIdentifier(from: hash)
        return "\(id)"
    }

    private static func generateSignature(bytes: [Byte], keyPair: KeyPair) -> String {
        let hash = SHA256(bytes).digest()
        return keyPair.sign(hash).hexString()
    }

    private static func transactionFee(type: TransactionType) -> UInt64 {
        switch type {
        case .transfer: return Constants.Fee.transfer
        case .registerSecondPassphrase: return Constants.Fee.signature
        case .registerDelegate: return Constants.Fee.delegate
        case .castVotes: return Constants.Fee.vote
        case .registerMultisignature: return Constants.Fee.multisignature
        case .createDapp: return Constants.Fee.dapp
        case .transferIntoDapp: return Constants.Fee.inTransfer
        case .transferOutOfDapp: return Constants.Fee.outTransfer
        }
    }
}

// MARK: - Bytes

extension LocalTransaction {

    var bytes: [Byte] {
        return
            typeBytes +
            timestampBytes +
            senderPublicKeyBytes +
            recipientIdBytes +
            amountBytes +
            signatureBytes +
            signSignatureBytes
    }

    var typeBytes: [Byte] {
        return [type.rawValue]
    }

    var timestampBytes: [Byte] {
        return BytePacker.pack(timestamp, byteOrder: .littleEndian)
    }

    var senderPublicKeyBytes: [Byte] {
        return senderPublicKey?.hexBytes() ?? []
    }

    var recipientIdBytes: [Byte] {
        guard let value = recipientId?.filter({ Int("\($0)") != nil }), let number = UInt64(value) else { return [] }
        return BytePacker.pack(number, byteOrder: .bigEndian)
    }

    var amountBytes: [Byte] {
        return BytePacker.pack(amount, byteOrder: .littleEndian)
    }

    var signatureBytes: [Byte] {
        return signature?.hexBytes() ?? []
    }

    var signSignatureBytes: [Byte] {
        return signSignature?.hexBytes() ?? []
    }
}

// MARK: - Request Options

extension LocalTransaction {

    var requestOptions: RequestOptions {
        do {
            let data = try JSONEncoder().encode(self)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? RequestOptions
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
