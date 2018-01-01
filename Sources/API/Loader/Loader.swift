//
//  Loader.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// Loader - https://docs.lisk.io/docs/lisk-api-080-loader
public struct Loader {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Status

extension Loader {

    /// Retrieve the status of a Lisk Node
    /// https://docs.lisk.io/docs/lisk-api-080-loader#section-get-loading-status
    public func status(completionHandler: @escaping (Response<StatusResponse>) -> Void) {
        client.get(path: "loader/status", completionHandler: completionHandler)
    }
}

// MARK: - Sync

extension Loader {

    /// Retrieve the sync status of a Lisk Node
    /// https://docs.lisk.io/docs/lisk-api-080-loader#section-get-synchronization-status
    public func syncStatus(completionHandler: @escaping (Response<StatusSyncResponse>) -> Void) {
        client.get(path: "loader/status/sync", completionHandler: completionHandler)
    }
}

// MARK: - Ping

extension Loader {

    /// Retrieve the ping status of a Lisk Node
    /// https://docs.lisk.io/docs/lisk-api-080-loader#section-get-block-receipt-status
    public func pingStatus(completionHandler: @escaping (Response<StatusPingResponse>) -> Void) {
        client.get(path: "loader/status/ping", completionHandler: completionHandler)
    }
}
