//
//  Blocks.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

/// Blocks - https://docs.lisk.io/docs/lisk-api-080-blocks
public struct Blocks: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Get

extension Blocks {

    /// Get a block by id
    public func block(id: String, completionHandler: @escaping (Response<BlockResponse>) -> Void) {
        let options = ["id": id]
        client.get(path: "blocks/get", options: options, completionHandler: completionHandler)
    }
}

// MARK: - List

extension Blocks {

    /// List blocks
    ///
    /// - Parameters:
    ///   - generatorPublicKey: who generated the block
    ///   - height: height of block
    ///   - previousBlock: previous block
    ///   - totalAmount: total amount in block
    ///   - totalFee: total fee of block
    ///   - limit: limit number of returned transactions
    ///   - offset: used for paging, offset by certain number of transactions
    ///   - orderBy: sort results by a column and direction
    ///   - join: defaults to 'or', specify 'and' for an AND join of passed in parameters
    public func blocks(generatorPublicKey: String? = nil, height: Int? = nil, previousBlock: String? = nil, totalAmount: Int? = nil, totalFee: Int? = nil, limit: UInt? = nil, offset: UInt? = nil, orderBy: OrderBy? = nil, join: PropertyJoin = .or, completionHandler: @escaping (Response<BlocksResponse>) -> Void) {
        var options: RequestOptions = [:]
        if let value = generatorPublicKey { options["\(join.rawValue)generatorPublicKey"] = value }
        if let value = height { options["\(join.rawValue)height"] = value }
        if let value = previousBlock { options["\(join.rawValue)previousBlock"] = value }
        if let value = totalAmount { options["\(join.rawValue)totalAmount"] = value }
        if let value = totalFee { options["\(join.rawValue)totalFee"] = value }
        if let value = limit { options["limit"] = value }
        if let value = offset { options["offset"] = value }
        if let value = orderBy { options["orderBy"] = "\(value.column):\(value.direction.rawValue)" }

        client.get(path: "blocks", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Misc

extension Blocks {

    /// Get current status
    public func status(completionHandler: @escaping (Response<StatusResponse>) -> Void) {
        client.get(path: "blocks/getStatus", completionHandler: completionHandler)
    }

    /// Get current fee
    public func fee(completionHandler: @escaping (Response<FeeResponse>) -> Void) {
        client.get(path: "blocks/getFee", completionHandler: completionHandler)
    }

    /// Get current fees
    public func fees(completionHandler: @escaping (Response<FeesResponse>) -> Void) {
        client.get(path: "blocks/getFees", completionHandler: completionHandler)
    }

    /// Get current reward
    public func reward(completionHandler: @escaping (Response<RewardResponse>) -> Void) {
        client.get(path: "blocks/getReward", completionHandler: completionHandler)
    }

    /// Get current supply
    public func supply(completionHandler: @escaping (Response<SupplyResponse>) -> Void) {
        client.get(path: "blocks/getSupply", completionHandler: completionHandler)
    }

    /// Get current height
    public func height(completionHandler: @escaping (Response<HeightResponse>) -> Void) {
        client.get(path: "blocks/getHeight", completionHandler: completionHandler)
    }

    /// Get current nethash
    public func nethash(completionHandler: @escaping (Response<NethashResponse>) -> Void) {
        client.get(path: "blocks/getNethash", completionHandler: completionHandler)
    }

    /// Get current milestone
    public func milestone(completionHandler: @escaping (Response<MilestoneResponse>) -> Void) {
        client.get(path: "blocks/getMilestone", completionHandler: completionHandler)
    }
}
