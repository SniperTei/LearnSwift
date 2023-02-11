//
//  EverydayData.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation

struct EverydayData: NetworkRequestProtocol {
    var method: String
    
    // 接口地址
    var url: URL = URL(string: "https://www.mxnzp.com/api/daily_word/recommend")!
    var parameters: [String : Any] = [
            "app_id": ConstEncryptValues.everydayWordAppId,
            "app_secret": ConstEncryptValues.everydayWordAppSecret,
            "count":4]
    var headers: [String : String] = [:]
}

extension EverydayData {
    // 是否使用模拟数据
    var useMockData: Bool {
        return true
    }
    // 模拟数据
    func mockDataResponse() -> Data {
        
        let data = [
            "code": 200,
            "msg": "success",
            "data": [
                [
                    "content": "你的人生，就像一张地图，你要做的就是，不断地探索，不断地前进，不断地发现新的世界。",
                    "author": "《海底两万里》",
                ],
                [
                    "content": "人生就像一场旅行，不要因为一些小烦恼而放弃自己的梦想。",
                    "author": "《海底3万里》",
                ]
            ]
        ] as [String : Any]

        let dataJson = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

        return dataJson
    }
}
