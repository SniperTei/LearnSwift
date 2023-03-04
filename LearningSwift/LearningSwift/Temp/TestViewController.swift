//
//  TestViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/21.
//

import Foundation
import UIKit

class TestViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let doubleColorBall = randomLotteryNumberDoubleColor()
        print("双色球: \(doubleColorBall.0) + \(doubleColorBall.1)")

        let bigHappyBall = randomLotteryNumberBigHappy()
        print("大乐透: \(bigHappyBall.0) + \(bigHappyBall.1)")
    }

    private func setupUI() {
        
    }
    
    // 随机生成双色球
    private func randomLotteryNumberDoubleColor() -> ([Int], Int) {
        let redBallScope = [Int](1...33)
        let blueBallScope = [Int](1...16)

        let redBallRandom = redBallScope.shuffled()
        let blueBallRandom = blueBallScope.shuffled()

        let redBall = redBallRandom[0...5]
        let blueBall = blueBallRandom[0]
        
        // print("红球: \(redBall.sorted())")
        // print("蓝球: \(blueBall)")

        return (redBall.sorted(), blueBall)
    }

    // 随机生成大乐透
    private func randomLotteryNumberBigHappy() -> ([Int], [Int]) {
        let redBallScope = [Int](1...35)
        let blueBallScope = [Int](1...12)

        let redBallRandom = redBallScope.shuffled()
        let blueBallRandom = blueBallScope.shuffled()

        let redBall = redBallRandom[0...4]
        let blueBall = blueBallRandom[0...1]
        
        // print("红球: \(redBall.sorted())")
        // print("蓝球: \(blueBall.sorted())")

        return (redBall.sorted(), blueBall.sorted())
    }

}
