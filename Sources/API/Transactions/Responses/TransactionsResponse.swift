//
//  TransactionsResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-transactions#section-get-transaction
extension Transactions {

    public struct TransactionsResponse: APIResponse {

        public let success: Bool

        public let transactions: [TransactionModel]
    }
}
