//
//  APIError.swift
//  Lisk
//
//  Created by Andrew Barba on 12/27/17.
//

import Foundation

/// Protocol describing an error
public struct APIError: Decodable {

    /// Internal backing message
    private let _message: String?

    /// Internal backing error
    private let _error: String?

    /// Public error message
    public lazy var message: String = _message ?? _error ?? "Unexpected Error"

    internal init(message: String? = nil) {
        self._message = message
        self._error = nil
    }
}

extension APIError {

    /// Describes an unexpected error
    public static let unexpected = APIError(message: "Unexpected Error")

    /// Describes an unknown error response
    public static let unknown = APIError(message: "Unknown Error")
}
