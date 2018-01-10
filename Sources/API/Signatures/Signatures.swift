//
//  Signatures.swift
//  LiskPackageDescription
//
//  Created by Andrew Barba on 1/10/18.
//

import Foundation

/// Signatures - https://docs.lisk.io/docs/lisk-api-080-signatures
public struct Signatures: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Register

extension Signatures {

    public func register(secondSecret: String, secret: String, completionHandler: @escaping (Response<Transactions.BroadcastResponse>) -> Void) {
        do {
            let (publicKey, _) = try Crypto.keys(fromSecret: secondSecret)
            let asset = ["signature": ["publicKey": publicKey]]
            let transaction = LocalTransaction(.registerSecondPassphrase, amount: 0, asset: asset)
            let signedTransaction = try transaction.signed(secret: secret, secondSecret: nil)
            print(signedTransaction)
            Transactions().broadcast(signedTransaction: signedTransaction, completionHandler: completionHandler)
        } catch {
            let response = APIResponseError(message: error.localizedDescription)
            completionHandler(.error(response: response))
        }
    }
}

// MARK: - Fee

extension Signatures {

    /// Get fee for registering second passphrase
    public func fee(completionHandler: @escaping (Response<FeeResponse>) -> Void) {
        client.get(path: "signatures/fee", completionHandler: completionHandler)
    }
}
