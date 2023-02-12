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
    func startLoading() {
        debugPrint("Protocol Start Loading")
        UIApplication.shared.keyWindow?.addSubview(self.loadingView)
        self.loadingView.startLoading()
    }
    
    func stopLoading() {
        debugPrint("Protocol Stop Loading")
        // self.loadingView.stopLoading()
    }

    var loadingView: LoadingView {
        return LoadingView.shared
    }
}