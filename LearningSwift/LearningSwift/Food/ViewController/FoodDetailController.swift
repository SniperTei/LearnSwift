//
//  FoodDetailController.swift
//  LearningSwift
//
//  Created by zhengnan on 2023/4/19.
//

import Foundation
import UIKit

class FoodDetailController: UIViewController {
    
    var foodItem : FoodItem?

    lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()

    lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupUI()

        foodNameLabel.text = foodItem?.foodname
//        foodImageView.image = foodItem?.foodimg
        foodDescriptionLabel.text = foodItem?.fooddesc
    }

    func setupUI() {
        view.addSubview(foodNameLabel)
        view.addSubview(foodImageView)
        view.addSubview(foodDescriptionLabel)

        foodNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(30)
        }

        foodImageView.snp.makeConstraints { (make) in
            make.top.equalTo(foodNameLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(200)
        }

        foodDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodImageView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(100)
        }
    }
}
