//
//  LoaderStatusSyncTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class LoaderStatusSyncTests: LiskTestCase {

    func testMainnetSyncStatus() {
        let loader = Loader(client: mainNetClient)
        let response = tryRequest { loader.syncStatus(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertFalse(response.syncing)
    }

    func testMainPeerSyncStatus() {
        let loader = Loader(client: mainPeerClient)
        let response = tryRequest { loader.syncStatus(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertFalse(response.syncing)
    }
}
