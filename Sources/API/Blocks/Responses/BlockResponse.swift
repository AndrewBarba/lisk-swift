//
//  BlockResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

extension Blocks {

    public struct BlockResponse: APIResponse {

        public let success: Bool

        public let block: BlockModel
    }

    public struct BlocksResponse: APIResponse {

        public let success: Bool

        public let blocks: [BlockModel]
    }
}
