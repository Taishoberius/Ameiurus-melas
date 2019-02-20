//
//  DialogFlowApi.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 05/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation
import Alamofire

struct DialogFlowApi: Api {
    var endpoints: [String : Endpoint] = [:]
    var baseUrl: String
    var accessToken: String
    var version: DialogFlowVersion
    var lang: LanguageTag
    let sessionId = UUID().uuidString

    init(version: DialogFlowVersion, accessToken: String, lang: LanguageTag) {
        self.accessToken = accessToken
        self.version = version
        self.baseUrl = "https://api.dialogflow.com/\(version.rawValue)/"
        self.lang = lang
    }

    public func callQuery(userQuery: DialogFlowQuery, callback: @escaping (BotResponse) -> Void) {
        call(endpoint: DialogFlowEndpoint.init(parameters: userQuery, method: .post, url: "query")) { (response) in
            callback(response)
        }
    }

    public func call(endpoint: Endpoint, callback: @escaping (BotResponse) -> Void) {
        Alamofire.request(baseUrl + endpoint.url, method: endpoint.method, parameters: endpoint.parameters.toJson(), encoding: JSONEncoding.default, headers: ["Authorization" : "Bearer \(accessToken)"])
            .responseJSON { (response) in
                print(self.baseUrl + endpoint.url)
                switch response.result {
                case .failure(let error):
                    callback(BotResponse.init(type: .failure, response: error.localizedDescription))
                    break
                case .success:
                    guard let data = response.data else {
                        callback(BotResponse.init(type: .failure, response: "no data found"))
                        return
                    }
                    let decoder = JSONDecoder()
                    let obj = try! decoder.decode(DialogFlowResponse.self, from: data)
                    callback(BotResponse.init(type: .success, response: obj.result?.speech ?? ""))
                    break
                }
        }
    }
}
