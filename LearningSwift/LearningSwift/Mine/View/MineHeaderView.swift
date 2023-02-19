//
//  MineHeaderView.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import UIKit

class MineHeaderView: UIView {
    
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "header")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sniper"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var headerSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var headerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("登录", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        // button.addTarget(self, action: #selector(headerButtonAction), for: .touchUpInside)
        return button
    }()
    
    // private lazy var headerMenuView: MineHeaderMenuView = {
    //     let menuView = MineHeaderMenuView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 100))
    //     return menuView
    // }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.headerImageView)
        self.addSubview(self.headerTitleLabel)
        self.addSubview(self.headerSubTitleLabel)
        self.addSubview(self.headerButton)
        // self.addSubview(self.headerMenuView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.headerImageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height - 100)
        self.headerTitleLabel.frame = CGRect(x: 20, y: self.headerImageView.frame.size.height - 50, width: 100, height: 20)
        self.headerSubTitleLabel.frame = CGRect(x: 20, y: self.headerTitleLabel.frame.origin.y + self.headerTitleLabel.frame.size.height, width: 100, height: 20)
    }
}