//
//  LotteryViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/28.
//

import Foundation
import UIKit

class LotteryViewController: BaseViewController {
    // 生成的彩票列表
    private lazy var lotteryTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingCell.cellReuseId)
        tableView.frame = CGRect(x: 0, y: ConstSize.naviBarHeight + 20 + 30, width: self.view.frame.size.width, height: self.view.frame.size.height - ConstSize.naviBarHeight)
        tableView.rowHeight = 50
        return tableView
    }()
    // 生成数量
    private lazy var generateTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: ConstSize.naviBarHeight + 20, width: 120, height: 30))
        textField.placeholder = "生成数量"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        return textField
    }()

    // 生成按钮
    private lazy var generateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("生成", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(generateButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var lotteryList: [String] = {
        return []
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "彩票"

        setupUI()
    }

    private func setupUI() {
        view.addSubview(generateTextField)
        
        view.addSubview(generateButton)
        generateButton.frame = CGRect(x: view.frame.size.width - 100 - 20, y: ConstSize.naviBarHeight + 20, width: 100, height: 30)

        view.addSubview(lotteryTableView)
    }

    @objc private func generateButtonAction() {
        generateTextField.resignFirstResponder()
        let count = Int(generateTextField.text ?? "0") ?? 0
        if count <= 0 {
            return
        }

        lotteryList.removeAll()

        for _ in 0..<count {
            let lottery = randomLotteryNumberDoubleColor()
            let lotteryString = "红球: \(lottery.0) 蓝球: \(lottery.1)"
            lotteryList.append(lotteryString)
        }
        lotteryTableView.reloadData()
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

extension LotteryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lotteryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.cellReuseId, for: indexPath)
        // cell.textLabel?.text = indexPath.row == 0 ? "双色球" : "大乐透"
        cell.textLabel?.text = lotteryList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // if indexPath.row == 0 {
        //     let doubleColorBall = randomLotteryNumberDoubleColor()
        //     print("双色球: \(doubleColorBall.0) + \(doubleColorBall.1)")
        // } else {
        //     let bigHappyBall = randomLotteryNumberBigHappy()
        //     print("大乐透: \(bigHappyBall.0) + \(bigHappyBall.1)")
        // }
    }
}
