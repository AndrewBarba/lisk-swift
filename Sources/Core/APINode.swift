//
//  APINode.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Represents a Lisk node with API enabled
public struct APINode {

    /// Hostname or IP address of this node
    public let hostname: String

    public init(hostname: String) {
        self.hostname = hostname
    }
}

extension APINode {

    /// Mainnet nodes
    public static let mainnet: [APINode] = [
        .init(hostname: "node01.lisk.io"),
        .init(hostname: "node02.lisk.io"),
        .init(hostname: "node03.lisk.io"),
        .init(hostname: "node04.lisk.io"),
        .init(hostname: "node05.lisk.io"),
        .init(hostname: "node06.lisk.io"),
        .init(hostname: "node07.lisk.io"),
        .init(hostname: "node08.lisk.io")
    ]

    /// Testnet nodes
    public static let testnet: [APINode] = [
        .init(hostname: "testnet-wallet.lisknode.io")
    ]
}

extension APINode {

    /// Selects a random node from a list of nodes
    public static func random(from nodes: [APINode] = APINode.mainnet) -> APINode {
        let index = Random.roll(max: nodes.count)
        return nodes[index]
    }
}
