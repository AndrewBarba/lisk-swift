//
//  APINethash.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

private let mainnetNethash = "ed14889723f24ecc54871d058d98ce91ff2f973192075c0155ba2b7b70ad2511"

private let testnetNethash = "da3ed6a45429278bac2666961289ca17ad86595d33b31037615d4b8e8f158bba"

public struct APINethash {

    public let contentType = "application/json"

    public let clientOS = "lisk-api-swift"

    public let minVersion = ">=0.5.0"

    public let version: String

    public let port: String

    public let nethash: String

    public let broadhash: String

    private init(port: String, nethash: String, broadhash: String, version: String) {
        self.port = port
        self.nethash = nethash
        self.broadhash = broadhash
        self.version = version
    }
}

extension APINethash {

    public static func mainnet(port: String, nethash: String? = nil) -> APINethash {
        let version = nethash == nil ? Constants.version : "0.0.0a"
        return .init(port: port, nethash: nethash ?? mainnetNethash, broadhash: mainnetNethash, version: version)
    }

    public static func testnet(port: String, nethash: String? = nil) -> APINethash {
        let version = nethash == nil ? Constants.version : "0.0.0a"
        return .init(port: port, nethash: nethash ?? testnetNethash, broadhash: testnetNethash, version: version)
    }
}
