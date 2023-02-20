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

struct FoodTypeItem: HandyJSON {
    let foodtype: String
    let foodtypename: String
    let foodlist: [FoodItem]

    init() {
        foodtype = ""
        foodlist = []
        foodtypename = ""
    }
}

struct FoodMenuListData: HandyJSON{
    
    let menulist: [FoodTypeItem]

    init() {
        
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
