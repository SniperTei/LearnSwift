//
//  FoodMenuSectionHeaderView.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/20.
//

import Foundation
import UIKit

class FoodMenuSectionHeaderView: UICollectionReusableView {
    
    static let headerReuseId = "FoodMenuSectionHeaderView"

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    // 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 15, y: 0, width: 100, height: 60)
        backgroundColor = ConstColor.mainColor
        // titleLabel.snp.makeConstraints { (make) in
        //     make.left.equalTo(15)
        //     make.centerY.equalToSuperview()
        // }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
