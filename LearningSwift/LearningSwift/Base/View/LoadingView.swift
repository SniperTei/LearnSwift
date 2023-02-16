//
//  LoadingView.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation
import UIKit

class LoadingView: UIView {

    static let shared = LoadingView(frame: UIScreen.main.bounds)
    // 两个请求同事需要loading的时候，loadingCount会大于1, 等于0的时候才会隐藏loading
    private var loadingCount: Int = 0

    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        // activityIndicatorView.color = .red
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()

    private lazy var loadingBackgroundView: UIView = {
        let loadingBackgroundView = UIView()
        loadingBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        return loadingBackgroundView
    }()

    private lazy var loadingMaskView: UIView = {
        let loadingMaskView = UIView()
        loadingMaskView.backgroundColor = UIColor.clear
        return loadingMaskView
    }()

    private lazy var loadingLabel: UILabel = {
        let loadingLabel = UILabel()
        loadingLabel.text = "Loading..."
        loadingLabel.textColor = .white
        loadingLabel.font = UIFont.systemFont(ofSize: 16)
        loadingLabel.sizeToFit()
        return loadingLabel
    }()

    // private lazy var loadingImageView: UIImageView = {
    //     let loadingImageView = UIImageView()
    //     let loadingUrl = URL(string: "https://img.zcool.cn/community/0177aa60ac8ffe11013f47208b2584.gif")
    //     // loadingImageView.image = UIImage(named: "loading")
    //     loadingImageView.kf.setImage(with: loadingUrl)
    //     loadingImageView.sizeToFit()
    //     return loadingImageView
    // }()

    func setupUI() {
        debugPrint("self setupUI")
        // loading遮罩
        self.loadingMaskView.frame = self.bounds
        self.addSubview(self.loadingMaskView)
        loadingMaskView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        // loading背景
        self.loadingBackgroundView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.loadingBackgroundView.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        self.addSubview(self.loadingBackgroundView)
        // loading动画
        self.activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.activityIndicatorView.center = CGPoint(x: self.loadingBackgroundView.frame.size.width * 0.5, y: self.loadingBackgroundView.frame.size.height * 0.5 - 10)
        self.loadingBackgroundView.addSubview(self.activityIndicatorView)
        // self.loadingImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        // self.loadingImageView.center = CGPoint(x: self.loadingBackgroundView.frame.size.width * 0.5, y: self.loadingBackgroundView.frame.size.height * 0.5 - 10)
        // self.loadingBackgroundView.addSubview(self.loadingImageView)
        // loading文字提示
        self.loadingLabel.center = CGPoint(x: self.loadingBackgroundView.frame.size.width * 0.5, y: self.activityIndicatorView.center.y + 40)
        self.loadingBackgroundView.addSubview(self.loadingLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        loadingCount += 1
        activityIndicatorView.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    func stopLoading() {
        loadingCount -= 1
        if loadingCount <= 0 {
            activityIndicatorView.stopAnimating()
            loadingCount = 0
            self.removeFromSuperview()
        }
    }
}
