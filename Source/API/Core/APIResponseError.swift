//
//  APIResponseError.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public struct APIResponseError: APIResponse {

    public var success: Bool {
        return false
    }

    public let error: String
}
