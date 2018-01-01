//
//  Crypto.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/1/18.
//

import Foundation
import CryptoSwift
import Ed25519

public struct Crypto {

    public func keys(fromSecret secret: String) throws -> (publicKey: String, privateKey: String) {
        let bytes = secret.bytes.sha256()
        let seed = try Seed(bytes: bytes)
        let keyPair = KeyPair(seed: seed)
        return (keyPair.publicKey.bytes.toHexString(), keyPair.privateKey.bytes.toHexString())
    }

    public func address(fromPublicKey publicKey: String) -> String {

        let bytes = publicKey.sha256().bytes

        print(Array(bytes[0..<8]))

        var _bytes: [UInt8] = []
        for i in 0..<8 {
            _bytes.append(bytes[7 - i])
        }

        let data = Data(bytes: _bytes)
        let value = Int(littleEndian: data.withUnsafeBytes { $0.pointee })
        return "\(value)L"
    }
}
