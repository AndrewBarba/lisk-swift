//
//  SignatureFeeResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/10/18.
//

import Foundation

extension Signatures {

    public struct FeeResponse: APIResponse {

        public let success: Bool

        public let fee: Int
    }
}
