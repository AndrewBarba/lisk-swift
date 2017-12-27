//
//  APIResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public protocol APIResponse: Decodable {

    var success: Bool { get }
}
