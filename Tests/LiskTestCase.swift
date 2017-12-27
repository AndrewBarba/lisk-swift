//
//  LiskTestCase.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class LiskTestCase: XCTestCase {

    let mainNetClient = APIClient.mainnet

    let testNetClient = APIClient.testnet

    let mainPeerClient = APIClient(options: .init(ssl: false, node: .init(hostname: "lisk0.abarba.me")))

    @discardableResult
    func tryRequest<R>(_ block: (@escaping (Response<R>) -> Void) -> Void) -> R {
        let expectation = XCTestExpectation()

        var result: R?

        block() { response in
            switch response {
            case .success(let r):
                result = r
            case .error(let error):
                print(error)
                result = nil
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)

        XCTAssertNotNil(result)

        return result!
    }
}
