//
//  MovieNewsCollectionCell.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import UIKit

class MovieNewsCollectionCell: UICollectionViewCell {
    
    static let cellReuseId = "MovieNewsCollectionCell"
    
    private lazy var movieNewsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var movieNewsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieNewsTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(movieNewsImageView)
        self.contentView.addSubview(movieNewsTitleLabel)
        self.contentView.addSubview(movieNewsTimeLabel)

        movieNewsImageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 100)
        movieNewsTitleLabel.frame = CGRect(x: 0, y: 100, width: self.contentView.frame.width, height: 20)
        movieNewsTimeLabel.frame = CGRect(x: 0, y: 120, width: self.contentView.frame.width, height: 20)

        
        // movieNewsImageView.snp.makeConstraints { (make) in
        //     make.top.left.right.equalToSuperview()
        //     make.height.equalTo(100)
        // }
        
        // movieNewsTitleLabel.snp.makeConstraints { (make) in
        //     make.top.equalTo(movieNewsImageView.snp.bottom).offset(10)
        //     make.left.right.equalToSuperview()
        // }
        
        // movieNewsTimeLabel.snp.makeConstraints { (make) in
        //     make.top.equalTo(movieNewsTitleLabel.snp.bottom).offset(10)
        //     make.left.right.equalToSuperview()
        //     make.bottom.equalToSuperview()
        // }
    }
    
    func configCell(movieNewsItem: MovieNewsItem) {
        movieNewsImageView.kf.setImage(with: URL(string: movieNewsItem.picUrl ?? "https://file.moyublog.com/d/file/2020-11-23/2f244df08224090b843e2641c55643e7.jpg"))
        movieNewsTitleLabel.text = movieNewsItem.title
        movieNewsTimeLabel.text = movieNewsItem.ctime
    }
}
