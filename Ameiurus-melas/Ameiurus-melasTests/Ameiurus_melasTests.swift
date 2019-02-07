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
        let query = DialogFlowQuery(lang: "fr", sessionId: "azertyuiop", query: "coucou")
        Alamofire.request("https://api.dialogflow.com/v1/", method: .post, parameters: query.toJson(), encoding: JSONEncoding.default, headers: ["Authorization": "0ea8f922a2104e608b234fd645defadc"]).responseJSON {
            switch $0.result {
            case .success(let json):
                print(json)
            case .failure(_):
                print("failed")
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
