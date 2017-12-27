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
        let sync = tryRequest { loader.syncStatus($0) }
        XCTAssert(sync.success)
        XCTAssertFalse(sync.syncing)
    }

    func testMainPeerSyncStatus() {
        let loader = Loader(client: mainPeerClient)
        let sync = tryRequest { loader.syncStatus($0) }
        XCTAssert(sync.success)
        XCTAssertFalse(sync.syncing)
    }
}
