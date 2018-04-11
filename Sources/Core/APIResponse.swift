//
//  APIResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//

import Foundation

/// Protocol describing an response
public protocol APIResponse: Decodable {

    /// All api responses have a success boolean
    var success: Bool { get }
}
