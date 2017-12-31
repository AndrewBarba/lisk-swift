//
//  DelegatesDelegateModel.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

extension Delegates {

    public struct DelegateModel: Decodable {

        public let username: String

        public let address: String

        public let publicKey: String

        public let vote: String

        public let producedblocks: UInt64

        public let missedblocks: UInt64

        public let rate: UInt64

        public let rank: UInt64

        public let approval: Double

        public let productivity: Double
    }
}
