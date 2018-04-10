//
//  APINethash.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Nethash options that are sent as request headers
public struct APINethash {

    /// HTTP content type
    public let contentType = "application/json"

    /// Swift os
    public let clientOS = "lisk-api-swift"

    /// Minmimum supported api version
    public let minVersion = ">=1.0.0"

    /// Nethash
    public let nethash: String

    /// Broadhash
    public let broadhash: String

    /// Origin port
    public let port: String

    /// Current api version
    public let version: String

    private init(nethash: String, broadhash: String, port: String, version: String) {
        self.nethash = nethash
        self.broadhash = broadhash
        self.port = port
        self.version = version
    }
}

extension APINethash {

    /// Mainnet options
    public static let mainnet: APINethash = .init(
        nethash: Constants.Nethash.main,
        broadhash: Constants.Nethash.main,
        port: Constants.Port.ssl,
        version: Constants.version
    )

    /// Testnet options
    public static let testnet: APINethash = .init(
        nethash: Constants.Nethash.test,
        broadhash: Constants.Nethash.test,
        port: Constants.Port.test,
        version: Constants.version
    )

    /// Betanet options
    public static let betanet: APINethash = .init(
        nethash: Constants.Nethash.beta,
        broadhash: Constants.Nethash.beta,
        port: Constants.Port.beta,
        version: Constants.version
    )
}
