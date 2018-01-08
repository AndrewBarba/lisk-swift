//
//  PeersPeerResponse.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

/// https://docs.lisk.io/docs/lisk-api-080-peers#section-get-peer
extension Peers {

    public struct PeerResponse: APIResponse {

        public let success: Bool

        public let peer: PeerModel
    }

    public struct PeersResponse: APIResponse {

        public let success: Bool

        public let peers: [PeerModel]
    }
}
