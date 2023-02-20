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

    lazy var foodCollectionView: UICollectionView = {
        let y: CGFloat = ConstSize.naviBarHeight
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ConstSize.screenWidth / 4, height: ConstSize.screenWidth / 4)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: ConstSize.screenWidth, height: 60)
        let foodCollectionView = UICollectionView(frame: CGRect(x: 0, y: y, width: ConstSize.screenWidth, height: ConstSize.screenHeight - ConstSize.tabbarHeight - y), collectionViewLayout: layout)
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(FoodMenuSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FoodMenuSectionHeaderView.headerReuseId)
        foodCollectionView.register(FoodMenuItemCell.self, forCellWithReuseIdentifier: FoodMenuItemCell.cellReuseId)
        // foodCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "UICollectionReusableView.reuseId")
        foodCollectionView.backgroundColor = UIColor.white
        return foodCollectionView
    }()
    
    lazy var foodList: Array = {
      return Array<FoodTypeItem>()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        fetchFoodList()
    }
    
    private func setupUI() {
//        self.title = "美食"
        self.navigationItem.title = "家饭朴老师的菜单"
        view.addSubview(foodCollectionView)
    }
}

// MARK: - Fetch Data
extension FoodViewController {
    func fetchFoodList() {
        let foodListData = FoodListData(method: "GET")
        NetworkManager.shared.sendRequest(foodListData) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                let foodListResponse = JSONDeserializer<FoodListResponse>.deserializeFrom(json: String(data: data, encoding: .utf8))
                let dataResponse = foodListResponse?.data
                let menulist = dataResponse?.menulist
                guard menulist != nil else { return }
                for foodTypeItem in menulist! {
                    self.foodList.append(foodTypeItem)
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

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("foodList.count: \(foodList.count)")
        return self.foodList.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let foodTypeItem = foodList[section]
        print("foodTypeItem.foodlist.count: \(foodTypeItem.foodlist.count)")
        return foodTypeItem.foodlist.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FoodMenuSectionHeaderView.headerReuseId, for: indexPath) as! FoodMenuSectionHeaderView
            let foodTypeItem = foodList[indexPath.section]
            headerView.titleLabel.text = foodTypeItem.foodtypename
            return headerView
        }
        // if kind == UICollectionView.elementKindSectionFooter {
        //     let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "UICollectionReusableView.reuseId", for: indexPath)
        //     footerView.backgroundColor = UIColor.orange
        //     return footerView
        // }
        return UICollectionReusableView()
    }

    // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //     return CGSize(width: ConstSize.screenWidth, height: 30)
    // }

    // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //     return CGSize(width: ConstSize.screenWidth, height: 10)
    // }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodMenuItemCell.cellReuseId, for: indexPath) as! FoodMenuItemCell
        let foodTypeItem = foodList[indexPath.section]
        let foodlist = foodTypeItem.foodlist
        let foodItem = foodlist[indexPath.row]
        cell.titleLabel.text = foodItem.foodname
//        print("foodItem.foodimg: \(foodItem.foodimg)")
       cell.imageView.kf.setImage(with: URL(string: foodItem.foodimg))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let foodItem = foodList[indexPath.row]
        // let foodDetailVC = FoodDetailViewController()
        // foodDetailVC.foodId = foodItem.id
        // navigationController?.pushViewController(foodDetailVC, animated: true)
    }
}
