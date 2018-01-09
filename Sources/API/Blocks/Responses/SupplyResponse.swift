//
//  SupplyResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

extension Blocks {

    public struct SupplyResponse: APIResponse {

        public let success: Bool

        public let supply: Int
    }
}
