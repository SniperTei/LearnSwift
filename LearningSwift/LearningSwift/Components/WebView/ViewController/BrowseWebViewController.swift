//
//  BrowseWebViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/20.
//

import Foundation
import UIKit
import WebKit

class BrowseWebViewController: BaseViewController {

    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: CGRect(x: 0, y: ConstSize.naviBarHeight, width: self.view.frame.size.width, height: self.view.frame.size.height - ConstSize.naviBarHeight))
//        webView.navigationDelegate = self
        return webView
    }()

    private var url: String = ""

    init(url: String) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setupUI()
    }

    private func setupUI() {
        self.view.addSubview(webView)

        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
    }
}
