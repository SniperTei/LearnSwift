//
//  MovieNewsData.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation

struct MovieNewsData: NetworkRequestProtocol {
    var method: String
    
    // 接口地址
    var url: URL = URL(string: "https://apis.tianapi.com/film/index")!
    var parameters: [String : Any] = ["num": 10,
                                      "key": ConstEncryptValues.movieNewsKey]
    var headers: [String : String] = [:]

}

// MARK: - Mock Data
extension MovieNewsData {

    var useMockData: Bool {
        return true
    }
    func mockDataResponse() -> Data {
        let data = [
            "code": 200,
            "msg": "success",
            "result": [ // 这里在真实接口中是result  不是data
                "curpage": 1,
                "allnum": 500,
                "newslist": [
                    [
                        "id": "cd31fcd056f9e9f3e7612f0a848b5dac",
                        "ctime": "2023-02-18 00:00",
                        "title": "《毒舌律师》现场获金鸡奖邀约 谢君豪喜提牛舌饼",
                        "description": "上映后在中国香港地区取得超高票房成绩的《毒舌律师》，日前在内地定档。2月17日晚，导演吴炜伦携主演谢君豪、王丹妮现身北京参加首映礼，并在映后见面会上与观众交流了电影的创作感受。",
                        "source": "1905电影网",
                        "picUrl": "https://image14.m1905.cn/uploadfile/2023/0218/thumb_1_320_174_20230218053405859728_watermark.jpg",
                        "url": "https://www.1905.com/news/20230218/1614474.shtml"
                    ],
                    [
                        "id": "e6ca4bacbfe94df3d0f91cfbc7979ebb",
                        "ctime": "2023-02-18 00:00",
                        "title": "《毒舌律师》北京首映口碑获赞 主创谈幕后故事",
                        "description": "2月17日，电影《毒舌律师》在北京举行首映礼，导演吴炜伦、主演谢君豪、王丹妮亮相现场，与现场观众互动，分享创作历程，诉说他们趣味盎然的创作历程。",
                        "source": "1905电影网",
                        "picUrl": "https://image13.m1905.cn/uploadfile/2023/0218/thumb_1_320_174_20230218011354758697.jpg",
                        "url": "https://www.1905.com/news/20230218/1614463.shtml"
                    ],
                    [
                        "id": "99ae532c963b7d514cafb85a148c6e52",
                        "ctime": "2023-02-18 00:00",
                        "title": "漫威《惊奇队长2》曝光海报 北美推迟至11月上映",
                        "description": "近日，漫威旗下影片《惊奇队长2》，曝光了一张全新的海报。在海报上，“三大惊奇”逐一亮相。此外，影片修改了自己的档期。从原定档期今年7月28日推迟至同年11月10日北美上映。",
                        "source": "1905电影网",
                        "picUrl": "https://image13.m1905.cn/uploadfile/2023/0218/thumb_1_320_174_20230218013639583888.jpg",
                        "url": "https://www.1905.com/news/20230218/1614465.shtml"
                    ],
                    [
                        "id": "bff2cb46ed28827a426d163f6b9b111a",
                        "ctime": "2023-02-18 00:00",
                        "title": "《幽灵公馆》北美提档7.28 改编自迪士尼游乐项目",
                        "description": "日前，迪士尼旗下的影片《幽灵公馆》宣布改档。影片从原计划的8月11日，提前两周至7月28日上映",
                        "source": "1905电影网",
                        "picUrl": "https://image14.m1905.cn/uploadfile/2023/0218/thumb_1_320_174_20230218020338540338.jpg",
                        "url": "https://www.1905.com/news/20230218/1614467.shtml"
                    ],
                    [
                        "id": "bc79302737d30e703f35a48e5d6aa597",
                        "ctime": "2023-02-18 00:00",
                        "title": "大本X达蒙！《AIR》曝复古海报 耐克公司签约乔丹",
                        "description": "本·阿弗莱克、马特·达蒙主演新片《AIR》发布新海报。在海报上，影片中的大部分角色悉数登场，大面积的留白，复古字体的使用。都让这张海报看起来非常复古。",
                        "source": "1905电影网",
                        "picUrl": "https://image11.m1905.cn/uploadfile/2023/0218/thumb_1_320_174_20230218020915387811.jpg",
                        "url": "https://www.1905.com/news/20230218/1614468.shtml"
                    ],
                    [
                        "id": "97435c7f020fe36d573fe8dfb5e9a9b9",
                        "ctime": "2023-02-17 00:00",
                        "title": "《我的幸福婚约》曝预告 目黑莲今田美樱相互救赎",
                        "description": "距离上映一个月之际，电影《我的幸福婚约》于2月17日晚发布了一则特别版预告，分别以久堂清霞（目黑莲饰）和斋森美世（今田美樱饰）的视角讲述了二人相互羁绊、救赎的纯爱故事。",
                        "source": "1905电影网",
                        "picUrl": "https://image14.m1905.cn/uploadfile/2023/0217/thumb_1_320_174_20230217101234868262.jpg",
                        "url": "https://www.1905.com/news/20230217/1614419.shtml"
                    ],
                    [
                        "id": "0ce505d83eb0db7818629ad4b63a57a2",
                        "ctime": "2023-02-17 00:00",
                        "title": "黄子华主演《毒舌律师》曝海报 65城开启超前点映",
                        "description": "2月17日，电影《毒舌律师》发布预售海报，宣布正式开启预售。影片将于本周末（2月18日/19日）开启广东省及全国21城超前点映，2月24日全国上映。本片由江志强监制，吴炜伦执导，黄子华、谢君豪、王丹妮、廖子妤、王敏德领……",
                        "source": "1905电影网",
                        "picUrl": "https://image14.m1905.cn/uploadfile/2023/0217/thumb_1_320_174_20230217112813360632.jpg",
                        "url": "https://www.1905.com/news/20230217/1614327.shtml"
                    ],
                    [
                        "id": "fd299f9714c5679de73da5a3edd7e170",
                        "ctime": "2023-02-17 00:00",
                        "title": "《俄罗斯方块》首曝预告 揭秘大热游戏的幕后故事",
                        "description": "近日，电影《俄罗斯方块》发布首款预告，影片聚焦电子游戏史上最知名的游戏之一——俄罗斯方块，将讲述该款游戏是如何成为全球畅销作品的。",
                        "source": "1905电影网",
                        "picUrl": "https://image13.m1905.cn/uploadfile/2023/0217/thumb_1_320_174_20230217113823134295.jpg",
                        "url": "https://www.1905.com/news/20230217/1614330.shtml"
                    ],
                    [
                        "id": "ebceed5a3249b4d1cc1b4ad70c2b1a8d",
                        "ctime": "2023-02-17 00:00",
                        "title": "《保你平安》定档3.10 大鹏李雪琴一路狂飙辟谣",
                        "description": "电影《保你平安》正式发布定档海报，宣布定档3月10日。本片由大鹏执导，陈祉希担任总制片人，苏彪、大鹏编剧，大鹏、李雪琴、尹正、王迅、王圣迪领衔主演，马丽特邀友情出演，宋茜、白宇特邀出演，贾冰、杨迪、潘斌龙、……",
                        "source": "1905电影网",
                        "picUrl": "https://image14.m1905.cn/uploadfile/2023/0217/thumb_1_320_174_20230217113809299022.jpg",
                        "url": "https://www.1905.com/news/20230217/1614331.shtml"
                    ],
                    [
                        "id": "4d0f64fa57e7bf7d7b2eca14e72e8a64",
                        "ctime": "2023-02-17 00:00",
                        "title": "A-Lin献唱《不二兄弟》主题曲 李茂演自闭症患者",
                        "description": "2月17日，由新锐青年导演郭修篆执导，李茂、林哲熹领衔主演，何泓姗、巴图主演，将于3月3日正式上映的电影《不二兄弟》发布主题曲《你是我的歌》MV，歌曲由天生歌姬A-Lin倾情献唱，温柔深情的声线演绎出一对兄弟在困境……",
                        "source": "1905电影网",
                        "picUrl": "https://image11.m1905.cn/uploadfile/2023/0217/thumb_1_320_174_20230217011226923968.jpg",
                        "url": "https://www.1905.com/news/20230217/1614333.shtml"
                    ]
                ]
            ]
        ] as [String : Any]

        let dataJson = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

        return dataJson
    }
}
