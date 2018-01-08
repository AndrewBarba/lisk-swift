//
//  PeersPeerModel.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import Foundation

extension Peers {

    public struct PeerModel: Decodable {

        public enum State: UInt8, Decodable {
            case banned = 0
            case disconnected = 1
            case connected = 2
        }

        public let ip: String

        public let port: UInt64

        public let state: State

        public let os: String

        public let version: String

        public let broadhash: String

        public let height: UInt64

        public let updated: Double

        public let nonce: String
    }
}
