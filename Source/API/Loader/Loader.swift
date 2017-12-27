//
//  Loader.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public struct Loader {

    // MARK: - Properties

    public let client: APIClient

    // MARK: - Init

    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Status

extension Loader {

    public func status(_ completionHandler: @escaping (Response<LoaderStatusResponse>) -> Void) {
        self.client.get(path: "loader/status", completionHandler: completionHandler)
    }
}

// MARK: - Sync

extension Loader {

    public func syncStatus(_ completionHandler: @escaping (Response<LoaderStatusSyncResponse>) -> Void) {
        self.client.get(path: "loader/status/sync", completionHandler: completionHandler)
    }
}

// MARK: - Ping

extension Loader {

    public func pingStatus(_ completionHandler: @escaping (Response<LoaderStatusPingResponse>) -> Void) {
        self.client.get(path: "loader/status/ping", completionHandler: completionHandler)
    }
}
