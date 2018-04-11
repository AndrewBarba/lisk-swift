//
//  APIOptions.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//

import Foundation

/// Options for creating an API client
public struct APIOptions {

    /// Force node selection
    public let nodes: [APINode]

    /// Nethash
    public let nethash: APINethash

    /// Selects a random node
    public let randomNode: Bool

    /// Get a node
    public var node: APINode {
        return nodes.select(random: randomNode)
    }
}

extension APIOptions {

    /// Mainnet options
    public static let mainnet: APIOptions = .init(nodes: .mainnet, nethash: .mainnet, randomNode: true)

    /// Testnet options
    public static let testnet: APIOptions = .init(nodes: .testnet, nethash: .testnet, randomNode: true)

    /// Betanet options
    public static let betanet: APIOptions = .init(nodes: .betanet, nethash: .mainnet, randomNode: true)
}
