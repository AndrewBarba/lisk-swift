//
//  SignaturesFeeTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/10/18.
//

import XCTest
@testable import Lisk

class SignaturesFeeTests: LiskTestCase {

    func testMainnetFee() {
        let signatures = Signatures(client: mainNetClient)
        let response = tryRequest { signatures.fee(completionHandler: $0) }
        XCTAssert(response.success)
    }
}
