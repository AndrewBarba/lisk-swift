//
//  AccountModel.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

extension Accounts {

    public struct AccountModel: APIModel {

        public let address: String

        public let balance: String

        public let unconfirmedBalance: String

        public let publicKey: String

        public let unconfirmedSignature: UInt8

        public let secondSignature: UInt8
    }
}
