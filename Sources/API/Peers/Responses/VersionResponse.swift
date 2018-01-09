//
//  VersionResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-peers#section-get-peer-version-build-time
extension Peers {

    public struct VersionResponse: APIResponse {

        public let success: Bool

        public let version: String

        public let build: String
    }
}

