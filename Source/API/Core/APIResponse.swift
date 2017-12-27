//
//  APIResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Protocol describing an response
public protocol APIResponse: Decodable {

    /// All api responses have a success boolean
    var success: Bool { get }
}
