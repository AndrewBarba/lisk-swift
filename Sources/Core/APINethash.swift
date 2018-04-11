//
//  APINethash.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//

import Foundation

/// Nethash options that are sent as request headers
public struct APINethash {

    /// Nethash
    public let nethash: String

    /// Current api version
    public let version: String

    /// Minmimum supported api version
    public let minVersion = ">=1.0.0"

    /// HTTP content type
    public let contentType = "application/json"

    /// Swift os
    public let os = "lisk-api-swift"

    private init(nethash: String, version: String) {
        self.nethash = nethash
        self.version = version
    }
}

extension APINethash {

    /// Mainnet options
    public static let mainnet: APINethash = .init(nethash: Constants.Nethash.main, version: Constants.version)

    /// Testnet options
    public static let testnet: APINethash = .init(nethash: Constants.Nethash.test, version: Constants.version)

    /// Betanet options
    public static let betanet: APINethash = .init(nethash: Constants.Nethash.beta, version: Constants.version)
}
