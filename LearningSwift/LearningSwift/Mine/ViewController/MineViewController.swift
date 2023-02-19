//
//  MineViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import UIKit

class MineViewController: BaseViewController {

//    private lazy var settingTableView: UITableView = {
//        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
//        return tableView
//    }()
//
//    private lazy var settingDataList: [Dictionary<String, String>] = {
//        return settingConfigData
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "我的"
        setupUI()
        // self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "设置", style: .plain, target: self, action: #selector(rightBarButtonClick))
    }
    
    private func setupUI() {
//        view.addSubview(settingTableView)
    }
    
}

extension MineViewController {
//    private lazy var settingConfigData = {
//        return [
//            [
//                "settingTitle": "设置",
//                "settingIcon": "setting",
//            ],
//            [
//                "settingTitle": "工具",
//                "settingIcon": "tool",
//            ],
//            [
//                "settingTitle": "通用",
//                "settingIcon": "general",
//            ],
//            [
//                "settingTitle": "关于",
//                "settingIcon": "about",
//            ],
//        ]
//    }()
}
