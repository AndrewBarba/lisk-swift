//
//  PeersResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-peers#section-get-peer
extension Peers {

    public struct PeersResponse: APIResponse {

        public let success: Bool

        public let peers: [PeerModel]
    }
}
