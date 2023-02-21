//
//  FoodMenuItemCell.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/16.
//

import Foundation
import UIKit

class FoodMenuItemCell: UICollectionViewCell {

    static let cellReuseId = "foodMenuItemCell"

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

    // 圆角图片
    func loadCornerImage(url: String) {
        let url = URL(string: url)
        let placeholder = ConstColor.colorToImage(color: UIColor.lightGray)
        imageView.kf.setImage(with: url, placeholder: placeholder, options: nil, progressBlock: nil) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                let roundImg = value.image.kf.image(withRoundRadius: 10, fit: self.imageView.bounds.size)
                self.imageView.image = roundImg
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView.frame = CGRect(x: 10, y: 10, width: self.contentView.frame.size.width - 20, height: self.contentView.frame.size.height - 40)
        self.titleLabel.frame = CGRect(x: 10, y: self.imageView.frame.size.height + 10, width: self.contentView.frame.size.width - 20, height: 20)
    }
}
