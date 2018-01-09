//
//  Peers.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// Peers - https://docs.lisk.io/docs/lisk-api-080-peers
public struct Peers: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Get

extension Peers {

    /// Get a peer by ip and port
    public func peer(ip: String, port: Int, completionHandler: @escaping (Response<PeerResponse>) -> Void) {
        let options: RequestOptions = ["ip": ip, "port": port]
        client.get(path: "peers/get", options: options, completionHandler: completionHandler)
    }
}

// MARK: - List

extension Peers {

    /// List peers
    ///
    /// - Parameters:
    ///   - state: state of peer
    ///   - version: version of peer
    ///   - os: os of peer
    ///   - limit: limit number of returned transactions
    ///   - offset: used for paging, offset by certain number of transactions
    ///   - orderBy: sort results by a column and direction
    ///   - join: defaults to 'or', specify 'and' for an AND join of passed in parameters
    public func peers(state: PeerModel.State? = nil, version: String? = nil, os: String? = nil, limit: UInt? = nil, offset: UInt? = nil, orderBy: OrderBy? = nil, join: PropertyJoin = .or, completionHandler: @escaping (Response<PeersResponse>) -> Void) {
        var options: RequestOptions = [:]
        if let value = state { options["\(join.rawValue)state"] = value.rawValue }
        if let value = version { options["\(join.rawValue)version"] = value }
        if let value = os { options["\(join.rawValue)os"] = value }
        if let value = limit { options["limit"] = value }
        if let value = offset { options["offset"] = value }
        if let value = orderBy { options["orderBy"] = "\(value.column):\(value.direction.rawValue)" }

        client.get(path: "peers", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Version

extension Peers {

    /// Returns current nodes version and build
    public func version(completionHandler: @escaping (Response<VersionResponse>) -> Void) {
        client.get(path: "peers/version", completionHandler: completionHandler)
    }
}
