//
//  Delegates.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//

import Foundation

/// Delegates - https://docs.lisk.io/docs/lisk-api-080-delegates
public struct Delegates: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Get

extension Delegates {

    /// Get a delegate by username
    public func delegate(username: String, completionHandler: @escaping (Response<DelegateResponse>) -> Void) {
        let options = ["username": username]
        client.get(path: "delegates/get", options: options, completionHandler: completionHandler)
    }

    /// Get a delegate by public key
    public func delegate(publicKey: String, completionHandler: @escaping (Response<DelegateResponse>) -> Void) {
        let options = ["publicKey": publicKey]
        client.get(path: "delegates/get", options: options, completionHandler: completionHandler)
    }
}

// MARK: - List

extension Delegates {

    /// List delegate objects
    ///
    /// - Parameters:
    ///   - limit: limit number of returned transactions
    ///   - offset: used for paging, offset by certain number of transactions
    ///   - orderBy: sort results by a column and direction
    public func delegates(limit: UInt? = nil, offset: UInt? = nil, orderBy: OrderBy? = nil, completionHandler: @escaping (Response<DelegatesResponse>) -> Void) {
        var options: RequestOptions = [:]
        if let value = limit { options["limit"] = value }
        if let value = offset { options["offset"] = value }
        if let value = orderBy { options["orderBy"] = "\(value.column):\(value.direction.rawValue)" }

        client.get(path: "delegates", options: options, completionHandler: completionHandler)
    }

    /// Search for a delegate
    ///
    /// - Parameters:
    ///   - query: Query string to search for
    ///   - orderBy: sort results by a column and direction
    public func search(query: String, orderBy: OrderBy? = nil, completionHandler: @escaping (Response<DelegatesResponse>) -> Void) {
        var options: RequestOptions = ["q": query]
        if let value = orderBy { options["orderBy"] = "\(value.column):\(value.direction.rawValue)" }

        client.get(path: "delegates/search", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Votes

extension Delegates {

    /// List which delegates and account is currently voting for
    public func votes(address: String, completionHandler: @escaping (Response<DelegatesResponse>) -> Void) {
        let options = ["address": address]
        client.get(path: "accounts/delegates", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Voters

extension Delegates {

    /// List accounts who voted for the given delegate (public key)
    public func voters(publicKey: String, completionHandler: @escaping (Response<VotersResponse>) -> Void) {
        let options = ["publicKey": publicKey]
        client.get(path: "delegates/voters", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Count

extension Delegates {

    /// Returns number of active delegates
    public func count(completionHandler: @escaping (Response<CountResponse>) -> Void) {
        client.get(path: "delegates/count", completionHandler: completionHandler)
    }
}
