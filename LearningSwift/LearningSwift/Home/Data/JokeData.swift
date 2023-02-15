//
//  JokeData.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation

struct JokeData: NetworkRequestProtocol {
    var method: String
    
    // 接口地址
    var url: URL = URL(string: "https://www.mxnzp.com/api/jokes/list")!
    var parameters: [String : Any] = [
           "app_id": ConstEncryptValues.jokeAppId,
           "app_secret": ConstEncryptValues.jokeAppSecret,
           "page":0
           ]
    var headers: [String : String] = [:]
}

extension JokeData {
    // 是否使用模拟数据
    var useMockData: Bool {
        return true
    }
    // 模拟数据
    func mockDataResponse() -> Data {
        
        let data = [
            "code": 200,
            "msg": "数据返回成功",
            "data": [
                "page": 0,
                "totalCount": 87145,
                "totalPage": 8715,
                "limit": 10,
                "list": [
                    [
                        "content":"mock课上，小雯觉得时间很难熬。　　就开始敲桌子打板凳，还念念有词道，“真是渡分如年啊！”　　然后，就问坐在旁边的小佩：“还有几分钟下课？”　　小佩看了看表，淡淡地说：“还有一年。”",
                        "updateTime": "2020-06-18 23:59:24",
                    ],
                    [
                        "content":"mock听说你又被开除啦? 是啊!老板娘怀孕了,就把我开除了～我去!老板娘怀孕开除你!你和她肚子的里孩子有什么关系啊? 就是怕有关系才把我开除的，老板娘说,怀孕的时候天天见我的样子,怕孩子生出来长的像我一样丑,就把我开除了……",
                        "updateTime": "2020-06-18 23:59:23",
                    ],
                    [
                        "content":"mock和女朋友分手，她舍不得我，说再给我做一顿饭。晚上去她家，她给我做的黄瓜花生拌的凉菜，煮的螃蟹，板栗炖牛肉，还做了个羊肉汤，之后还准备了西瓜，还给我剥桔子，她说看着我都吃了，就满足了，看她这么用心，我就都吃了，那么现在到底分，还是 ？",
                        "updateTime": "2020-06-18 23:59:22",
                    ],
                ]
            ]
        ] as [String : Any]

        let dataJson = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

        return dataJson
    }
}
