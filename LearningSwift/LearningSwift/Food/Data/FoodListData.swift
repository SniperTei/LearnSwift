//
//  FoodListData.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/16.
//

import Foundation

struct FoodListData: NetworkRequestProtocol {
    var method: String
    
    // 接口地址
    var url: URL = URL(string: "https://www.mxnzp.com/api/recipe/recommend")!
    var parameters: [String : Any] = ["count": 10]
    var headers: [String : String] = [:]

}

extension FoodListData {
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
                "menulist": [
                    [
                        "foodname": "酸辣土豆丝",
                        "foodimg": "https://file.moyublog.com/d/file/2020-11-23/2f244df08224090b843e2641c55643e7.jpg",
                        "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下午茶菜，下酒菜，都是非常不错的选择，下面就跟小编一起来学习下酸辣土豆丝的做法吧！",
                        "foodurl": "https://www.mxnzp.com/recipe/1613430000.html"
                    ],
                    [
                        "foodname": "酸辣土豆丝",
                        "foodimg": "https://file.moyublog.com/d/file/2020-11-23/2f244df08224090b843e2641c55643e7.jpg",
                        "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下午茶菜，下酒菜，都是非常不错的选择，下面就跟小编一起来学习下酸辣土豆丝的做法吧！",
                        "foodurl": "https://www.mxnzp.com/recipe/1613430000.html"
                    ],
                    [
                        "foodname": "酸辣土豆丝",
                        "foodimg": "https://file.moyublog.com/d/file/2020-11-23/2f244df08224090b843e2641c55643e7.jpg",
                        "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下午茶菜，下酒菜，都是非常不错的选择，下面就跟小编一起来学习下酸辣土豆丝的做法吧！",
                        "foodurl": "https://www.mxnzp.com/recipe/1613430000.html"
                    ]
                ]
            ]
        ] as [String : Any]

        let dataJson = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

        return dataJson
    }
}