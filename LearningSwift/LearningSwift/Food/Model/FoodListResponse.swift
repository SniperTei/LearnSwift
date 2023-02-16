//
//  FoodListResponse.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/16.
//

import Foundation
import HandyJSON

struct FoodItem: HandyJSON {
    
    let foodname: String
    let foodimg: String
    let fooddesc: String
    let foodurl: String

    init() {
        foodname = ""
        foodimg = ""
        fooddesc = ""
        foodurl = ""
    }
}

struct FoodMenuListData: HandyJSON{
    // let page: Int
    // let totalCount: Int
    // let totalPage: Int
    // let limit: Int
    let menulist: [FoodItem]

    init() {
        // page = 0
        // totalCount = 0
        // totalPage = 0
        // limit = 0
        menulist = []
    }
}

struct FoodListResponse: BaseResponseProtocol, HandyJSON {
    let code: Int
    let msg: String
    let data: FoodMenuListData

    typealias T = FoodMenuListData
    init() {
        code = 0
        msg = ""
        data = FoodMenuListData()
    }
}
