//
//  BlockStatusResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

extension Blocks {

    public struct StatusResponse: APIResponse {

        public let success: Bool

        public let height: Int

        public let fee: Int

        public let milestone: Int

        public let reward: Int

        public let supply: Int
    }
}
