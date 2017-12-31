//
//  AccountsAccountTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/31/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class AccountsAccountTests: LiskTestCase {

    func testMainnetAccount() {
        let accounts = Accounts(client: mainNetClient)
        let response = tryRequest { accounts.account(address: mainNetAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.account.address, mainNetAddress)
        XCTAssertEqual(response.account.publicKey, mainNetPublicKey)
    }
}
