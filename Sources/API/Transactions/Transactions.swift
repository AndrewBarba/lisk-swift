//
//  Transactions.swift
//  Lisk
//
//  Created by Andrew Barba on 1/2/18.
//

import Foundation

/// Type of transactions supported on Lisk network
public enum TransactionType: UInt8, Encodable {
    case transfer = 0
    case registerSecondPassphrase = 1
    case registerDelegate = 2
    case castVotes = 3
    case registerMultisignature = 4
    case createDapp = 5
    case transferIntoDapp = 6
    case transferOutOfDapp = 7
}

/// Loader - https://docs.lisk.io/docs/lisk-api-080-transactions
public struct Transactions: APIService {

    /// Client used to send requests
    public let client: APIClient

    /// Init
    public init(client: APIClient = .shared) {
        self.client = client
    }
}

// MARK: - Broadcast

extension Transactions {

    /// Broadcasts a locally signed transaction to the network
    public func broadcast(signedTransaction: LocalTransaction, completionHandler: @escaping (Response<BroadcastResponse>) -> Void) {
        guard signedTransaction.isSigned else {
            let response = APIResponseError(message: "Invalid Transaction - Transaction has not been signed")
            return completionHandler(.error(response: response))
        }
        let options = ["transaction": signedTransaction.requestOptions]
        let path = client.baseURL.absoluteString.replacingOccurrences(of: "/api", with: "/peer")
        client.post(path: "\(path)/transactions", options: options, completionHandler: completionHandler)
    }
}

// MARK: - Send

extension Transactions {

    /// Transfer LSK to a Lisk address using Local Signing
    public func transfer(lsk: Double, to recipient: String, secret: String, secondSecret: String? = nil, completionHandler: @escaping (Response<BroadcastResponse>) -> Void) {
        do {
            let transaction = LocalTransaction(.transfer, lsk: lsk, recipientId: recipient)
            let signedTransaction = try transaction.signed(secret: secret, secondSecret: secondSecret)
            broadcast(signedTransaction: signedTransaction, completionHandler: completionHandler)
        } catch {
            let response = APIResponseError(message: error.localizedDescription)
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
