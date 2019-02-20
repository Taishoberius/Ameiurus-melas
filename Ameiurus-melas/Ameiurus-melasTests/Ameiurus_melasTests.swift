//
//  Ameiurus_melasTests.swift
//  Ameiurus-melasTests
//
//  Created by David Linhares on 16/01/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import XCTest
import Alamofire
@testable import Ameiurus_melas

class Ameiurus_melasTests: XCTestCase {
    func testExample() {
        var api = DialogFlowApi(version: .V1, accessToken: "0ea8f922a2104e608b234fd645defadc", lang: .fr)
        let query = DialogFlowQuery(lang: "fr", sessionId: "azertyuiop", query: "coucou")
        api.callQuery(userQuery: query) {
            print($0.response)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
