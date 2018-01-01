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
        let bytes = SHA256(publicKey.hexBytes).digest()[0..<8].reversed()
        let data = Data(bytes: Array(bytes))
        let value = Int(bigEndian: data.withUnsafeBytes { $0.pointee })
        return "\(value)L"
    }
}

extension String {

    fileprivate var hexBytes: [UInt8] {
        var bytes = [UInt8]()
        bytes.reserveCapacity(count/2)
        var index = startIndex
        for _ in 0..<count/2 {
            let nextIndex = self.index(index, offsetBy: 2)
            if let b = UInt8(self[index..<nextIndex], radix: 16) {
                bytes.append(b)
            } else {
                return []
            }
            index = nextIndex
        }
        return bytes
    }
}

extension Sequence where Self.Element == UInt8 {

    fileprivate func hexString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
