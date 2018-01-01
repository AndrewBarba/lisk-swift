//
//  APIOptions.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Options for creating an API client
public struct APIOptions {

    /// Connect to Testnet
    public let testnet: Bool

    /// Use https:
    public let ssl: Bool

    /// Selects a random node
    public let randomNode: Bool

    /// Force node selection
    public let node: APINode?

    /// Port to connect to
    public let port: String?

    /// Optional nethash
    public let nethash: String?

    /// Set of banned nodes, unused for now
    public let bannedNodes: [APINode]?

    public init(testnet: Bool = false, ssl: Bool = true, randomNode: Bool = true, node: APINode? = nil, port: String? = nil, nethash: String? = nil, bannedNodes: [APINode]? = nil) {
        self.testnet = testnet
        self.ssl = ssl
        self.randomNode = randomNode
        self.node = node
        self.port = port
        self.nethash = nethash
        self.bannedNodes = bannedNodes
    }
}
