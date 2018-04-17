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
    public static func keys(fromPassphrase passphrase: String) throws -> (publicKey: String, privateKey: String) {
        let keyPair = try self.keyPair(fromPassphrase: passphrase)
        return (keyPair.publicKeyString, keyPair.privateKeyString)
    }

    /// Generate key pair from a given secret
    public static func keyPair(fromPassphrase passphrase: String) throws -> KeyPair {
        let bytes = SHA256(passphrase).digest()
        let seed = try Seed(bytes: bytes)
        return KeyPair(seed: seed)
    }

    /// Extract Lisk address from a public key
    public static func address(fromPublicKey publicKey: String) -> String {
        let bytes = SHA256(publicKey.hexBytes()).digest()
        let identifier = byteIdentifier(from: bytes)
        return "\(identifier)L"
    }

    /// Sign a message
    public static func signMessage(_ message: String, passphrase: String) throws -> String {
        let keyPair = try self.keyPair(fromPassphrase: passphrase)
        let bytes = keyPair.sign(message.hexBytes())
        return bytes.hexString()
    }

    /// Verify a message
    public static func verifyMessage(_ message: String, signature: String, publicKey: String) throws -> Bool {
        let key = try PublicKey(publicKey.hexBytes())
        return try key.verify(signature: signature.hexBytes(), message: message.hexBytes())
    }

    /// Epoch time relative to genesis block
    public static func timeIntervalSinceGenesis(offset: TimeInterval = 0) -> UInt32 {
        let now = Date().timeIntervalSince1970 + offset
        return UInt32(now - Constants.Time.epochSeconds)
    }

    /// Multiplies a given amount by Lisk fixed point
    public static func fixedPoint(amount: Double) -> UInt64 {
        return UInt64(amount * Constants.fixedPoint)
    }

    internal static func byteIdentifier(from bytes: [UInt8]) -> String {
        guard bytes.count >= 8 else { return "" }
        let leadingBytes = bytes[0..<8].reversed()
        let data = Data(bytes: Array(leadingBytes))
        let value = UInt64(bigEndian: data.withUnsafeBytes { $0.pointee })
        return "\(value)"
    }
}

extension KeyPair {

    /// Hex representation of public key
    public var publicKeyString: String {
        return publicKey.bytes.hexString()
    }

    /// Hex representation of private key
    public var privateKeyString: String {
        return privateKey.bytes.hexString()
    }
}

extension String {

    internal func hexBytes() -> [UInt8] {
        return (0..<count/2).reduce([]) { res, i in
            let indexStart = index(startIndex, offsetBy: i * 2)
            let indexEnd = index(indexStart, offsetBy: 2)
            let substring = self[indexStart..<indexEnd]
            return res + [UInt8(substring, radix: 16) ?? 0]
        }
    }
}

extension Sequence where Self.Element == UInt8 {

    internal func hexString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
