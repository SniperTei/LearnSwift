//
//  FoodViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/16.
//

import Foundation
import UIKit
import HandyJSON
import Kingfisher

class FoodViewController: BaseViewController {
    
    static let cellReuseId = "foodCell"

    lazy var foodCollectionView: UICollectionView = {
        let y: CGFloat = ConstSize.naviBarHeight
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ConstSize.screenWidth / 4, height: ConstSize.screenWidth / 4)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let foodCollectionView = UICollectionView(frame: CGRect(x: 0, y: y, width: ConstSize.screenWidth, height: ConstSize.screenHeight - ConstSize.tabbarHeight - y), collectionViewLayout: layout)
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(FoodMenuItemCell.self, forCellWithReuseIdentifier: FoodViewController.cellReuseId)
        foodCollectionView.backgroundColor = UIColor.white
        return foodCollectionView
    }()
    
    lazy var foodList: Array = {
      return Array<FoodItem>()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        fetchFoodList()
    }
    
    private func setupUI() {
        view.addSubview(foodCollectionView)
    }
}

// MARK: - Fetch Dat
extension FoodViewController {
    func fetchFoodList() {
        let foodListData = FoodListData(method: "GET")
        NetworkManager.shared.sendRequest(foodListData) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                let foodListResponse = JSONDeserializer<FoodListResponse>.deserializeFrom(json: String(data: data, encoding: .utf8))
                let dataResponse = foodListResponse?.data
                let foodList = dataResponse?.menulist
                guard foodList != nil else { return }
                for foodItem in foodList! {
                    self.foodList.append(foodItem)
                }
                self.foodCollectionView.reloadData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FoodViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewController.cellReuseId, for: indexPath) as! FoodMenuItemCell
        let foodItem = foodList[indexPath.row]
        cell.titleLabel.text = foodItem.foodname
        print("foodItem.foodimg: \(foodItem.foodimg)")
//        cell.imageView.kf.setImage(with: URL(string: foodItem.foodimg) ?? URL(string: "https://www.baidu.com/img/bd_logo1.png"))!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let foodItem = foodList[indexPath.row]
        // let foodDetailVC = FoodDetailViewController()
        // foodDetailVC.foodId = foodItem.id
        // navigationController?.pushViewController(foodDetailVC, animated: true)
    }
}
