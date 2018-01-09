//
//  Accounts.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Accounts - https://docs.lisk.io/docs/lisk-api-080-accounts
public struct Accounts: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Open

extension Accounts {

    /// Opens a new/existing Lisk account via secret passphrase
    /// https://docs.lisk.io/v1.4/docs/lisk-api-080-accounts#section-get-account-information
    public func open(secret: String, completionHandler: @escaping (Response<AccountResponse>) -> Void) {
        do {
            let (publicKey, _) = try Crypto.keys(fromSecret: secret)
            let address = Crypto.address(fromPublicKey: publicKey)
            self.account(address: address, completionHandler: completionHandler)
        } catch {
            let response = APIResponseError(message: "Invalid secret key")
            completionHandler(.error(response: response))
        }
    }
}

// MARK: - Balance

extension Accounts {

    /// Retrieve the balance of a Lisk address
    /// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-balance
    public func balance(address: String, completionHandler: @escaping (Response<BalanceResponse>) -> Void) {
        let options = ["address": address]
        client.get(path: "accounts/getBalance", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Public Key

extension Accounts {

    /// Retrieve the public key of a Lisk address
    /// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-public-key
    public func publicKey(address: String, completionHandler: @escaping (Response<PublicKeyResponse>) -> Void) {
        let options = ["address": address]
        client.get(path: "accounts/getPublicKey", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Account

extension Accounts {

    /// Retrieve the account info for an address
    /// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-information-from-address
    public func account(address: String, completionHandler: @escaping (Response<AccountResponse>) -> Void) {
        let options = ["address": address]
        client.get(path: "accounts", options: options, completionHandler: completionHandler)
    }
}
