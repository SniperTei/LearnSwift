//
//  SettingViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import UIKit

class SettingViewController: BaseViewController {

    private lazy var settingTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingCell.cellReuseId)
        tableView.frame = CGRect(x: 0, y: ConstSize.naviBarHeight, width: self.view.frame.size.width, height: self.view.frame.size.height - ConstSize.naviBarHeight)
        tableView.rowHeight = 50
        return tableView
    }()

    var settingDataList: [[String:Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setupUI()
    }

    private func setupUI() {
        self.view.addSubview(settingTableView)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingDataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.cellReuseId, for: indexPath)
        let settingJSON = settingDataList[indexPath.row]
        cell.textLabel?.text = settingJSON["title"] as? String
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let settingJSON = settingDataList[indexPath.row]
        let title = settingJSON["title"] as? String
        let name = settingJSON["name"] as? String
        print("title: \(title ?? ""), name: \(name ?? "")")
        if "calculator" == name {
            // let calculatorVC = TestViewController()
            let calculatorVC = CalculatorController()
            self.navigationController?.pushViewController(calculatorVC, animated: true)
        }
        if "lottery" == name {
            let lotteryVC = LotteryViewController()
            // let lotteryVC = TestViewController()
            self.navigationController?.pushViewController(lotteryVC, animated: true)
        }
    }
}
