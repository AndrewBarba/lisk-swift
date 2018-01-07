//
//  TransactionHelpers.swift
//  Lisk
//
//  Created by Andrew Barba on 1/7/18.
//

import Foundation
import Ed25519

internal struct TransactionHelpers {

    static func prepare(type: UInt8, amount: Double, to recipient: String, secret: String, secondSecret: String? = nil, timestamp: UInt32? = nil) throws -> TransactionBuilder {
        let keyPair = try Crypto().keyPair(fromSecret: secret)

        var transaction = TransactionBuilder()
        transaction.type = type
        transaction.amount = fixedPoint(amount: amount)
        transaction.fee = Constants.Fee.transfer
        transaction.recipientId = recipient
        transaction.senderPublicKey = keyPair.publicKeyString
        transaction.timestamp = timestamp ?? timeIntervalSinceGenesis()

        transaction.signature = signTransaction(transaction, keyPair: keyPair)

        if let secondSecret = secondSecret, type != 1 {
            let secondKeyPair = try Crypto().keyPair(fromSecret: secondSecret)
            transaction.signSignature = signTransaction(transaction, keyPair: secondKeyPair)
        }

        transaction.id = transactionId(transaction)

        return transaction
    }

    static func fixedPoint(amount: Double) -> UInt64 {
        return UInt64(amount * Constants.fixedPoint)
    }

    static func timeIntervalSinceGenesis(offset: TimeInterval = 0) -> UInt32 {
        let now = Date().timeIntervalSince1970 + offset
        return UInt32(now - Constants.Time.epochSeconds)
    }

    static func signTransaction(_ transaction: TransactionBuilder, keyPair: KeyPair) -> String {
        let hash = SHA256(transaction.bytes).digest()
        let signature = keyPair.sign(hash)
        return signature.hexString()
    }

    static func transactionId(_ transaction: TransactionBuilder) -> String {
        let bytes = SHA256(transaction.bytes).digest()[0..<8].reversed()
        let data = Data(bytes: Array(bytes))
        let value = Int(bigEndian: data.withUnsafeBytes { $0.pointee })
        return "\(value)"
    }
}
