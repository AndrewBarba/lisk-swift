//
//  DelegatesVoterModel.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

extension Delegates {

    public struct VoterModel: Decodable {

        public let username: String?

        public let address: String

        public let publicKey: String

        public let balance: String
    }
}
