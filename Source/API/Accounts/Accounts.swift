//
//  Accounts.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Accounts - https://docs.lisk.io/docs/lisk-api-080-accounts
public struct Accounts {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Balance

extension Accounts {

    /// Retrieve the balance of a Lisk address
    /// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-balance
    public func balance(address: String, completionHandler: @escaping (Response<BalanceResponse>) -> Void) {
        let options: RequestOptions = [
            "address": address
        ]
        client.get(path: "accounts/getBalance", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Public Key

extension Accounts {

    /// Retrieve the public key of a Lisk address
    /// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-public-key
    public func publicKey(address: String, completionHandler: @escaping (Response<PublicKeyResponse>) -> Void) {
        let options: RequestOptions = [
            "address": address
        ]
        client.get(path: "accounts/getPublicKey", options: options, completionHandler: completionHandler)
    }
}
