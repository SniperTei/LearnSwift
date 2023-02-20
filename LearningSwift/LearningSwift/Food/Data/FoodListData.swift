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
                        "foodtype": "huncai",
                        "foodtypename": "荤菜",
                        "foodlist":[
                            [
                                "foodname": "孜然牛肉",
                                "foodimg": "https://img2.baidu.com/it/u=3357866209,2506615632&fm=253&fmt=auto&app=138&f=JPEG?w=670&h=447",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "수육",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "锅包肉",
                                "foodimg": "https://img0.baidu.com/it/u=989090033,3714935503&fm=253&fmt=auto&app=138&f=PNG?w=200&h=200",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，"
                            ],
                            [
                                "foodname": "可乐鸡翅",
                                "foodimg": "https://img0.baidu.com/it/u=1445508888,1189551266&fm=253&fmt=auto&app=138&f=JPEG?w=600&h=400",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，"
                            ],
                            [
                                "foodname": "红烧排骨",
                                "foodimg": "https://img2.baidu.com/it/u=2704147,3155174626&fm=253&fmt=auto&app=138&f=JPEG?w=492&h=459",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，"
                            ]
                        ]
                    ],
                    [
                        "foodtype": "sucai",
                        "foodtypename": "素菜",
                        "foodlist":[
                            [
                                "foodname": "苦瓜炒蛋",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "炒蘑菇",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "西红柿炒鸡蛋",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，"
                            ],
                            [
                                "foodname": "锅包豆腐",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，"
                            ],
                        ]
                    ],
                    [
                        "foodtype": "liangcai",
                        "foodtypename": "凉菜",
                        "foodlist":[
                            [
                                "foodname": "黄瓜干豆腐",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "菠菜",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "黄瓜大头菜",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                        ]
                    ],
                    [
                        "foodtype": "soup",
                        "foodtypename": "汤",
                        "foodlist":[
                            [
                                "foodname": "豆腐汤",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "大酱汤",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "豆芽汤",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                        ]
                    ],
                    [
                        "foodtype": "xiafancai",
                        "foodtypename": "下饭菜",
                        "foodlist":[
                            [
                                "foodname": "张作林",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "空酱",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "蚬子",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                        ]
                    ],
                    [
                        "foodtype": "jiushui",
                        "foodtypename": "酒水",
                        "foodlist":[
                            [
                                "foodname": "福佳白",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "教士",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                            [
                                "foodname": "柏龙",
                                "foodimg": "https://www.mxnzp.com/upload/recipe/2019/12/19/1576730000_5dfb.jpg",
                                "fooddesc": "酸辣土豆丝，是一道非常简单的家常菜，口味酸辣，色泽金黄，酸辣爽口，是一道非常好吃的家常菜，下饭菜，下酒菜，下午茶，都是非常不错的选择，下面就跟随小编一起来学习下酸辣土豆丝的做法吧！",
                                "foodurl": "https://www.mxnzp.com/recipe/5dfb.html",
                            ],
                        ]
                    ],
                ]
            ]
        ] as [String : Any]

        let dataJson = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

        return dataJson
    }
}