//
//  BlockModel.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

extension Blocks {

    public struct BlockModel: APIModel {

        public let id: String

        public let version: Int

        public let timestamp: Int

        public let height: Int

        public let previousBlock: String

        public let numberOfTransactions: Int

        public let totalAmount: Int

        public let totalFee: Int

        public let reward: Int

        public let payloadHash: String

        public let generatorPublicKey: String

        public let generatorId: String

        public let blockSignature: String

        public let confirmations: Int

        public let totalForged: String
    }
}
