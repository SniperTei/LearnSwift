//
//  FoodMenuItemCell.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/16.
//

import Foundation
import UIKit

class FoodMenuItemCell: UICollectionViewCell {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView()
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.contentView.addSubview(self.imageView)
        
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.textAlignment = .center
        self.contentView.addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height - 20)
        self.titleLabel.frame = CGRect(x: 0, y: self.imageView.frame.size.height, width: self.contentView.frame.size.width, height: 20)
    }
}