//
//  BroadcastResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

extension Transactions {

    public struct BroadcastResponse: APIResponse {

        public let success: Bool

        public let transactionId: String
    }
}
