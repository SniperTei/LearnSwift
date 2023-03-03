//
//  LotteryViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/28.
//

import Foundation
import UIKit

class LotteryViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "彩票"

        setupUI()
    }

    private func setupUI() {
        
    }

    // 随机生成彩票号码
    private func randomLotteryNumber() {
        let redBall = [Int](1...33)
        let blueBall = [Int](1...16)

        let redBallRandom = redBall.shuffled()
        let blueBallRandom = blueBall.shuffled()

        print("红球: \(redBallRandom[0...5])")
        print("蓝球: \(blueBallRandom[0...1])")
    }
}
