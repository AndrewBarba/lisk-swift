//
//  Crypto.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/1/18.
//

import Foundation
import Ed25519

public struct Crypto {

    /// Generate public and private keys from a given secret
    public func keys(fromSecret secret: String) throws -> (publicKey: String, privateKey: String) {
        let bytes = SHA256(secret).digest()
        let seed = try Seed(bytes: bytes)
        let keyPair = KeyPair(seed: seed)
        let publicKey = keyPair.publicKey.bytes.hexString()
        let privateKey = keyPair.privateKey.bytes.hexString()
        return (publicKey, privateKey)
    }

    /// Extract Lisk address from a public key
    public func address(fromPublicKey publicKey: String) -> String {
        let bytes = SHA256(publicKey.hexBytes()).digest()[0..<8].reversed()
        let data = Data(bytes: Array(bytes))
        let value = Int(bigEndian: data.withUnsafeBytes { $0.pointee })
        return "\(value)L"
    }
}

extension String {

    fileprivate func hexBytes() -> [UInt8] {
        return (0..<count/2).reduce([]) { res, i in
            let indexStart = index(startIndex, offsetBy: i * 2)
            let indexEnd = index(indexStart, offsetBy: 2)
            let substring = self[indexStart..<indexEnd]
            return res + [UInt8(substring, radix: 16) ?? 0]
        }
    }
}

extension Sequence where Self.Element == UInt8 {

    fileprivate func hexString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
