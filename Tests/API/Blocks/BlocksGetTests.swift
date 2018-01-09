//
//  BlocksGetTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/9/18.
//

import XCTest
@testable import Lisk

class BlocksGetTests: LiskTestCase {

    func testMainnetGet() {
        let blockId = "6699130148421113207"
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.block(id: blockId, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.block.id, blockId)
    }
}
