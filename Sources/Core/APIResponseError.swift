//
//  APIResponseError.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//

import Foundation

/// API response error with an error message
public struct APIResponseError: APIResponse {

    /// Success is always false if this is an error
    public var success: Bool {
        return false
    }

    /// Error message
    public let message: String

    /// Private coding keys
    enum CodingKeys: String, CodingKey {
        case error = "error"
        case message = "message"
    }

    public init(message: String) {
        self.message = message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            message = try container.decode(String.self, forKey: .error)
        } catch {
            message = try container.decode(String.self, forKey: .message)
        }
    }
}
