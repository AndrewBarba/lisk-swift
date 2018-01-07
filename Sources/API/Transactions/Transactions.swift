//
//  Transactions.swift
//  Lisk
//
//  Created by Andrew Barba on 1/2/18.
//

import Foundation

/// Loader - https://docs.lisk.io/docs/lisk-api-080-transactions
public struct Transactions {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Broadcast

extension Transactions {

    /// [WIP] Broadcasts a locally signed transaction to the network
    public func broadcast(signedTransaction: TransactionBuilder, completionHandler: @escaping (Response<TransactionResponse>) -> Void) {
        let options = ["transaction": signedTransaction.requestOptions]
        client.post(path: "transactions", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Send

extension Transactions {

    /// [WIP] Transfer LSK to a Lisk address
    /// - Note: To send 1.2 LSK, pass amount as 1.2, it will be converted appropriately
    /// 1. getTransactionBytes()
    /// 2. crypto.hash() - sha256
    /// 3. crypto.signData()
    /// 4. set obj.signSignature
    public func transfer(amount: Double, to recipient: String, secret: String, secondSecret: String? = nil, completionHandler: @escaping (Response<TransactionResponse>) -> Void) {
        do {
            let transaction = try TransactionHelpers.prepare(type: 0, amount: amount, to: recipient, secret: secret, secondSecret: secondSecret)
            broadcast(signedTransaction: transaction, completionHandler: completionHandler)
        } catch {
            let response = APIResponseError(error: error.localizedDescription)
            completionHandler(.error(response: response))
        }
    }
}

// MARK: - Get

extension Transactions {

    /// Get a transaction by id
    public func transaction(id: String, completionHandler: @escaping (Response<TransactionResponse>) -> Void) {
        let options = ["id": id]
        client.get(path: "transactions/get", options: options, completionHandler: completionHandler)
    }

    /// Get an unconfirmed transaction by id
    public func unconfirmedTransaction(id: String, completionHandler: @escaping (Response<TransactionResponse>) -> Void) {
        let options = ["id": id]
        client.get(path: "transactions/unconfirmed/get", options: options, completionHandler: completionHandler)
    }

    /// Get a queued transaction by id
    public func queuedTransaction(id: String, completionHandler: @escaping (Response<TransactionResponse>) -> Void) {
        let options = ["id": id]
        client.get(path: "transactions/queued/get", options: options, completionHandler: completionHandler)
    }
}

// MARK: - List

extension Transactions {

    /// Combination of column and sort direction
    public struct OrderBy {
        public let column: String
        public let direction: OrderByDirection
    }

    /// Transactions sort order
    public enum OrderByDirection: String {
        case ascending = "asc"
        case descending = "desc"
    }

    /// Property join type
    public enum PropertyJoin: String {
        case or = ""
        case and = "AND:"
    }


    /// List transaction objects
    ///
    /// - Parameters:
    ///   - block: transactions for this block
    ///   - sender: transactions from this sender
    ///   - recipient: transactions to this recipient
    ///   - limit: limit number of returned transactions
    ///   - offset: used for paging, offset by certain number of transactions
    ///   - orderBy: sort results by a column and direction
    ///   - join: defaults to 'or', specify 'and' for an AND join of passed in parameters
    public func transactions(block: String? = nil, sender: String? = nil, recipient: String? = nil, limit: UInt? = nil, offset: UInt? = nil, orderBy: OrderBy? = nil, join: PropertyJoin = .or, completionHandler: @escaping (Response<TransactionsResponse>) -> Void) {
        var options: RequestOptions = [:]
        if let value = block { options["\(join.rawValue)blockId"] = value }
        if let value = sender { options["\(join.rawValue)senderId"] = value }
        if let value = recipient { options["\(join.rawValue)recipientId"] = value }
        if let value = limit { options["limit"] = value }
        if let value = offset { options["offset"] = value }
        if let value = orderBy { options["orderBy"] = "\(value.column):\(value.direction.rawValue)" }

        client.get(path: "transactions", options: options, completionHandler: completionHandler)
    }

    /// List unconfirmed transactions
    public func unconfirmedTransactions(completionHandler: @escaping (Response<TransactionsResponse>) -> Void) {
        client.get(path: "transactions/unconfirmed", completionHandler: completionHandler)
    }

    /// List queued transactions
    public func queuedTransactions(completionHandler: @escaping (Response<TransactionsResponse>) -> Void) {
        client.get(path: "transactions/queued", completionHandler: completionHandler)
    }
}
