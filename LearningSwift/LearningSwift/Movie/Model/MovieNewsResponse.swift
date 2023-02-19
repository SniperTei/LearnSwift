//
//  MovieNewsResponse.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import HandyJSON

struct MovieNewsItem: HandyJSON {
    let id: String
    let ctime: String
    let title: String
    let description: String
    let source: String
    let picUrl: String
    let url: String

    // 初始化
    init() {
        id = ""
        ctime = ""
        title = ""
        description = ""
        source = ""
        picUrl = ""
        url = ""
     }
}

struct MovieNewsRespData: HandyJSON {
    let curpage: Int?
    let allnum: Int?
    let newslist: [MovieNewsItem]
    // 初始化
    init() {
        curpage = 0
        allnum = 0
        newslist = []
    }
}

struct MovieNewsResponse: NetworkResponseProtocol, HandyJSON {
    let code: Int
    let msg: String
    let data: MovieNewsRespData
    let result : MovieNewsRespData
    
    typealias T = MovieNewsRespData
    // 初始化
    init() {
        code = 0
        msg = ""
        data = MovieNewsRespData()
        result = MovieNewsRespData()
    }
}
