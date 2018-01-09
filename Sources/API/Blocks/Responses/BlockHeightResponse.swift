//
//  BlockHeightResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

extension Blocks {

    public struct HeightResponse: APIResponse {

        public let success: Bool

        public let height: Int
    }
}
