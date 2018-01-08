//
//  APIService.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// API Service
public protocol APIService {

    var client: APIClient { get }

    init(client: APIClient)
}

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
