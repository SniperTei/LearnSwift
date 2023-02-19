//
//  MineViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import UIKit

class MineViewController: BaseViewController {

    // 头部视图
    private lazy var mineHeaderView: MineHeaderView = {
        let headerView = MineHeaderView(frame: CGRect(x: 0, y: ConstSize.naviBarHeight, width: self.view.frame.size.width, height: 200))
        headerView.backgroundColor = UIColor.orange
        return headerView
    }()
    // 设置列表
    private lazy var mineTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MineCell.cellReuseId)
        tableView.frame = CGRect(x: 0, y: self.mineHeaderView.frame.maxY, width: self.view.frame.size.width, height: self.view.frame.size.height - self.mineHeaderView.frame.maxY)
        tableView.rowHeight = 50
        return tableView
    }()

    private lazy var settingDataList: [String] = {
        // TODO: 先写死, 后期再优化
        return ["设置", "工具", "通用", "关于"]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "我的"

        setupUI()
        fetchData()
    }
    
    private func setupUI() {
        view.addSubview(mineHeaderView)
        view.addSubview(mineTableView)
    }
    
}

// MARK: - Fetch Data
extension MineViewController {
    private func fetchData() {
        mineTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MineViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingDataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MineCell.cellReuseId, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = settingDataList[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let settingVC = SettingViewController()
            self.navigationController?.pushViewController(settingVC, animated: true)
        default:
            break
        }
    }
}
