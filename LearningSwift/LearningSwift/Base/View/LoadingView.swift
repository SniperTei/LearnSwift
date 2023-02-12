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
    static let shared = LoadingView()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicatorView.center = self.center
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    func setupUI() {
        self.addSubview(self.activityIndicatorView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        self.activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        self.activityIndicatorView.stopAnimating()
    }
}