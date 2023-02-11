//
//  EverydayOneWordResponse.swift
//  LearningSwift
//
//  Created by Sniper on 2023/1/28.
//

import Foundation
import HandyJSON

struct EverydayOne: HandyJSON {
    let content: String
    let author: String
    // 这个不是后台返回的,是我自己加的,为了更好的显示图片 
    var lunbo: String
    
    init() {
        content = ""
        author = ""
        lunbo = "lunbo0"
    }
}

struct EverydayOneWordResponse: BaseResponseProtocol, HandyJSON {
    init() {
        code = 0
        msg = ""
        data = Array<EverydayOne>()
    }
   
    typealias T = Array
    let code: Int
    let msg: String
    let data: Array<EverydayOne>
}

extension EverydayOneWordResponse {
    var useMockData: Bool {
        return true
    }
    
    func mockDataResponse() -> Data {
        let mockResp = [
            "code": 200,
            "msg": "success",
            "data": [
                [
                    "content": "你的人生，就像一张地图，上面标注着你的目1",
                    "author": "aaa"
                ],
                [
                    "content": "你的人生，就像一张地图，上面标注着2",
                    "author": "bbb"
                ],
                [
                    "content": "你的人生，就像一张地图，上面标注着你的目3",
                    "author": "ccc"
                ],
                [
                    "content": "你的人生，就像一张地图，上面标注着你的目44",
                    "author": "ddd"
                ]
            ]
        ] as [String : Any]

        let data = try! JSONSerialization.data(withJSONObject: mockResp, options: .prettyPrinted)

        return data
    }
}