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

    let mainNetAddress = "14987768355736502769L"

    let mainNetPublicKey = "f33f878dc7e7177f60f3dcfef842b1cc3c947c3910eee6e8ecd33b9e1a7f38d7"

    @discardableResult
    func tryRequest<R>(_ block: (@escaping (Response<R>) -> Void) -> Void) -> R {
        let expectation = XCTestExpectation()

        var result: R?

        block() { response in
            switch response {
            case .success(let r):
                result = r
            case .error(let error):
                XCTFail(error.error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        return result!
    }

    @discardableResult
    func tryRequestError<R>(_ block: (@escaping (Response<R>) -> Void) -> Void) -> APIResponseError {
        let expectation = XCTestExpectation()
        var error: APIResponseError?
        block() { response in
            switch response {
            case .success:
                XCTFail("Expected an error response, request was succeeded")
            case .error(let _error):
                error = _error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        return error!
    }
}
