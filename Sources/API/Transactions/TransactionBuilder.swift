//
//  TransactionBuilder.swift
//  Lisk
//
//  Created by Andrew Barba on 1/7/18.
//

import Foundation

public struct TransactionBuilder: Encodable {

    var type: UInt8?
    var amount: UInt64?
    var fee: UInt64?
    var recipientId: String?
    var recipientPublicKey: String?
    var senderPublicKey: String?
    var timestamp: UInt32?
    var signature: String?
    var signSignature: String?
    var id: String?
}

// MARK: - Bytes

extension TransactionBuilder {

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
        guard let value = type else { return [] }
        return [value]
    }

    var timestampBytes: [Byte] {
        guard let value = timestamp else { return [] }
        return BytePacker.pack(value, byteOrder: .littleEndian)
    }

    var senderPublicKeyBytes: [Byte] {
        guard let value = senderPublicKey else { return [] }
        return value.hexBytes()
    }

    var recipientIdBytes: [Byte] {
        guard let value = recipientId?.filter({ Int("\($0)") != nil }), let number = UInt64(value) else { return [] }
        return BytePacker.pack(number, byteOrder: .bigEndian)
    }

    var amountBytes: [Byte] {
        guard let value = amount else { return [] }
        return BytePacker.pack(value, byteOrder: .littleEndian)
    }

    var signatureBytes: [Byte] {
        guard let value = signature else { return [] }
        return value.hexBytes()
    }

    var signSignatureBytes: [Byte] {
        guard let value = signSignature else { return [] }
        return value.hexBytes()
    }
}

// MARK: - Request Options

extension TransactionBuilder {

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
