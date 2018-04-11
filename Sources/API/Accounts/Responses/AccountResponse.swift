//
//  AccountResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-balance
extension Accounts {

    public struct AccountResponse: APIResponse {

        public let success: Bool

        public let account: AccountModel
    }
}
