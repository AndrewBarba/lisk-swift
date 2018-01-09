//
//  FeesModel.swift
//  Lisk
//
//  Created by Andrew Barba on 1/9/18.
//

import Foundation

extension Blocks {

    public struct FeesModel: APIModel {

        public let send: Int

        public let vote: Int

        public let secondsignature: Int

        public let delegate: Int

        public let multisignature: Int

        public let dapp: Int
    }
}
