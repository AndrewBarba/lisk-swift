//
//  DelegateVotersResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-delegates#section-get-voters
extension Delegates {

    public struct VotersResponse: APIResponse {

        public let success: Bool

        public let accounts: [VoterModel]
    }
}
