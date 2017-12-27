//
//  LoaderStatusSyncResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public struct LoaderStatusSyncResponse: APIResponse {

    public let success: Bool

    public let syncing: Bool

    public let blocks: UInt64

    public let height: UInt64

    public let broadhash: String

    public let consensus: UInt64
}
