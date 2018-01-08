//
//  AccountsPublicKeyTests.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class AccountsPublicKeyTests: LiskTestCase {

    func testMainnetPublicKey() {
        let accounts = Accounts(client: mainNetClient)
        let response = tryRequest { accounts.publicKey(address: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.publicKey, andrewPublicKey)
    }
}
