//
//  APIOptions.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public struct APIOptions {

    public let testnet: Bool

    public let ssl: Bool

    public let randomNode: Bool

    public let node: APINode?

    public let port: String?

    public let nethash: String?

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
