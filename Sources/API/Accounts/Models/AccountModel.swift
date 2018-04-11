//
//  AccountModel.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//

import Foundation

extension Accounts {

    public struct AccountModel: APIModel {

        public let address: String

        public let publicKey: String

        public let balance: String?

        public let unconfirmedBalance: String?

        public let secondPublicKey: String?

        public let delegate: Delegates.DelegateModel?
    }
}
