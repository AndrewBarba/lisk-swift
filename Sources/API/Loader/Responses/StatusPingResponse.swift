//
//  StatusPingResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-loader#section-get-block-receipt-status
extension Loader {

    public struct StatusPingResponse: APIResponse {

        public let success: Bool
    }
}
