//
//  DelegatesCountResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-delegates#section-get-delegates-count
extension Delegates {

    public struct CountResponse: APIResponse {

        public let success: Bool

        public let count: UInt64
    }
}
