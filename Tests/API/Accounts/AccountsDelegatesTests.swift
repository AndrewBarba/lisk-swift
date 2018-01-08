//
//  AccountsDelegatesTests.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class AccountsDelegatesTests: LiskTestCase {

    func testMainnetAccount() {
        let accounts = Accounts(client: mainNetClient)
        let response = tryRequest { accounts.delegates(address: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.delegates.count, 0)
    }
}
