//
//  SettingCell.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    static let cellReuseId = "settingCell"
    
    var iconImageView: UIImageView!
    var titleLabel: UILabel!
    var arrowImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.iconImageView = UIImageView()
        self.iconImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(self.iconImageView)
        
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel.textColor = UIColor.black
        self.contentView.addSubview(self.titleLabel)
        
        self.arrowImageView = UIImageView()
        self.arrowImageView.contentMode = .scaleAspectFit
        self.arrowImageView.image = UIImage(named: "arrow_right")
        self.contentView.addSubview(self.arrowImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.iconImageView.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
        self.titleLabel.frame = CGRect(x: self.iconImageView.frame.maxX + 10, y: 0, width: 100, height: self.contentView.frame.size.height)
        self.arrowImageView.frame = CGRect(x: self.contentView.frame.size.width - 15 - 20, y: 10, width: 20, height: 20)
    }
}