//
//  DelegateResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-transactions#section-get-delegate
extension Delegates {

    public struct DelegateResponse: APIResponse {

        public let success: Bool

        public let delegate: DelegateModel
    }

    public struct DelegatesResponse: APIResponse {

        public let success: Bool

        public let delegates: [DelegateModel]
    }
}
