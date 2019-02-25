//
//  Ameiurus_melasTests.swift
//  Ameiurus-melasTests
//
//  Created by David Linhares on 16/01/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import XCTest
@testable import Ameiurus_melas

class Ameiurus_melasTests: XCTestCase {
    func testExample() {
        let bot = Ameiurus(api: DialogFlowApi(version: .V1, accessToken: "098f4c5e9e574073b9dcb3426522142d", lang: .fr))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
