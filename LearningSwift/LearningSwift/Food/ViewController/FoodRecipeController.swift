//
//  FoodRecipeController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/3/7.
//

import Foundation
import UIKit

class FoodRecipeController: BaseViewController {
    // 预计会是播放视频的地方
    private lazy var foodView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.frame = CGRect(x: 0, y: ConstSize.naviBarHeight, width: ConstSize.screenWidth, height: 180)
        return view
    }()
    // 预计会是食谱的地方
    private lazy var recipeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.frame = CGRect(x: 0, y: foodView.frame.maxY, width: ConstSize.screenWidth, height: 180)
        return view
    }()
    // 预计会是制作方法的地方
    private lazy var cookView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.frame = CGRect(x: 0, y: recipeView.frame.maxY, width: ConstSize.screenWidth, height: 180)
        return view
    }()

    private lazy var commentTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingCell.cellReuseId)
        tableView.frame = CGRect(x: 0, y: cookView.frame.maxY, width: ConstSize.screenWidth, height: self.view.frame.size.height - ConstSize.naviBarHeight)
        tableView.rowHeight = 50
        return tableView
    }()

    private var commentDataList: [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        // 要不要把这3个放在tableview的header里??
        view.addSubview(foodView)
        view.addSubview(recipeView)
        view.addSubview(cookView)

        view.addSubview(commentTableView)
    }
}

extension FoodRecipeController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.cellReuseId, for: indexPath)
        let settingJSON = commentDataList[indexPath.row]
        cell.textLabel?.text = settingJSON["title"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
