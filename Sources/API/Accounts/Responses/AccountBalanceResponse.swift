//
//  AccountBalanceResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-accounts#section-get-account-balance
extension Accounts {

    public struct BalanceResponse: APIResponse {

        public let success: Bool

        public let balance: String

        public let unconfirmedBalance: String
    }
}
