//
//  Constants.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

/// API Constants copied from:
/// https://github.com/LiskHQ/lisk-js/blob/1.0.0/src/constants.js
public struct Constants {

    public static let version = "1.0.0"

    public static let fixedPoint: Double = pow(10, 8)

    public struct Fee {
        public static let transfer: Double = 0.1 * fixedPoint
        public static let data: Double = 0.1 * fixedPoint
        public static let inTransfer: Double = 0.1 * fixedPoint
        public static let outTransfer: Double = 0.1 * fixedPoint
        public static let signature: Double = 5 * fixedPoint
        public static let delegate: Double = 25 * fixedPoint
        public static let vote: Double = 1 * fixedPoint
        public static let multisignature: Double = 5 * fixedPoint
        public static let dapp: Double = 25 * fixedPoint
    }

    public struct Time {
        public static let epochMilliseconds: Double = 1464109200000
        public static let epochSeconds: TimeInterval = epochMilliseconds / 1000
        public static let epoch: Date = Date(timeIntervalSince1970: epochSeconds)
    }

    public struct Port {
        public static let live: String = "8000"
        public static let test: String = "7000"
        public static let ssl: String = "443"
    }
}
