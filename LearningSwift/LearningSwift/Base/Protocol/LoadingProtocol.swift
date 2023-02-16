//
//  LoadingProtocol.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation
import UIKit

protocol LoadingProtocol {

    func startLoading()
    func stopLoading()
}

extension LoadingProtocol {

    func startLoading() {
        debugPrint("Protocol Default Start Loading")
        let loadingView = LoadingView.shared
        loadingView.startLoading()
    }
    
    func stopLoading() {
        debugPrint("Protocol Default Stop Loading")
        let loadingView = LoadingView.shared
        loadingView.stopLoading()
    }
}
