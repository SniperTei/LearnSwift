//
//  LoadingView.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation
import UIKit

class LoadingView: UIView {

    // 单例
    // static let shared = LoadingView()

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
    
    // 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

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
        // loading文字提示
        self.loadingLabel.center = CGPoint(x: self.loadingBackgroundView.frame.size.width * 0.5, y: self.activityIndicatorView.center.y + 40)
        self.loadingBackgroundView.addSubview(self.loadingLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        self.activityIndicatorView.startAnimating()
        debugPrint("self.activityIndicatorView.center: \(self.activityIndicatorView.center)")
        debugPrint("self.activityIndicatorView.superview: \(self.activityIndicatorView.superview)")
        debugPrint("self.activityIndicatorView.isAnimationg \(self.activityIndicatorView.isAnimating)")
    }
    
    func stopLoading() {
       self.activityIndicatorView.stopAnimating()
    }
}
