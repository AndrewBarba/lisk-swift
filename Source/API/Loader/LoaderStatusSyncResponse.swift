//
//  LoaderStatusSyncResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-loader#section-get-synchronization-status
public struct LoaderStatusSyncResponse: APIResponse {

    public let success: Bool

    public let syncing: Bool

    public let blocks: UInt64

    public let height: UInt64

    public let broadhash: String

    public let consensus: UInt64
}
