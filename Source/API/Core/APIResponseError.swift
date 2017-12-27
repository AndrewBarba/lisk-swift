//
//  APIResponseError.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// API response error with an error message
public struct APIResponseError: APIResponse {

    /// Success is always false if this is an error
    public var success: Bool {
        return false
    }

    /// Error message
    public let error: String
}
