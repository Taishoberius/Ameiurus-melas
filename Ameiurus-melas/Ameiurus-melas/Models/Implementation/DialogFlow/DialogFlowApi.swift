//
//  DialogFlowApi.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 05/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

struct DialogFlowApi: Api {
    var endpoints: [Endpoint] = []
    
    var baseUrl: String
    var accessToken: String
    var version: DialogFlowVersion

    init(version: DialogFlowVersion, accessToken: String) {
        self.accessToken = accessToken
        self.version = version
        self.baseUrl = "https://api.dialogflow.com/\(version.rawValue)/"
    }
}
