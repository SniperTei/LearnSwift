//
//  AboutUsController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/3/7.
//

import Foundation
import UIKit

class AboutUsController: BaseViewController {
    
    private var aboutTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = UIColor.black
        textView.isEditable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(aboutTextView)
        aboutTextView.snp.makeConstraints { (make) in
            make.top.equalTo(ConstSize.naviBarHeight)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }

        let path = Bundle.main.path(forResource: "AboutUs", ofType: "txt")
        let content = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        aboutTextView.text = content
    }
}
