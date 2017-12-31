//
//  Delegates.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Delegates - https://docs.lisk.io/docs/lisk-api-080-delegates
public struct Delegates {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}
