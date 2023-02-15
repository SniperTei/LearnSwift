//
//  LoadingProtocol.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation
import UIKit

protocol LoadingProtocol {

    var loadingView: LoadingView { get }

    func startLoading()
    func stopLoading()
}

extension LoadingProtocol {

    var loadingView: LoadingView {
        let loadingView = LoadingView(frame: UIScreen.main.bounds)
        debugPrint("Protocol Default Loading View : \(loadingView)")
        return loadingView
    }

    func startLoading() {
        debugPrint("Protocol Default Start Loading")
        debugPrint("Protocol Default Start Loading View : \(loadingView)")
        UIApplication.shared.keyWindow?.addSubview(loadingView)
        loadingView.startLoading()
    }
    
    func stopLoading() {
        debugPrint("Protocol Default Stop Loading")
        self.loadingView.stopLoading()

    }
}