//
//  TransactionResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/2/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-transactions#section-get-transaction
extension Transactions {

    public struct TransactionResponse: APIResponse {

        public let success: Bool

        public let transaction: TransactionModel
    }
}
