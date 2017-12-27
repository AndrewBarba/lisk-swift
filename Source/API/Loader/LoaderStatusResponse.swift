//
//  LoaderStatusResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public struct LoaderStatusResponse: APIResponse {

    public let success: Bool

    public let loaded: Bool

    public let now: UInt64

    public let blocksCount: UInt64
}
