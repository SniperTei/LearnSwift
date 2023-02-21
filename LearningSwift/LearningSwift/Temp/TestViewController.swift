//
//  TestViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/21.
//

import Foundation
import UIKit

class TestViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let calculator = Calculator()
        // let result = calculator.calculate(10, by: calculator.subtractFrom(6))
        // print(result)

        setupUI()
    }

    private func setupUI() {
        let btnWidth: CGFloat = 50
        let btnHeight: CGFloat = 50
        let margin: CGFloat = 240
        // 一行4个按钮
        let btnCount: CGFloat = 4
        let btnMargin: CGFloat = (self.view.frame.size.width - btnCount * btnWidth) / (btnCount + 1)
        // 第一排加减乘除
        for i in 0..<4 {
            let btn = UIButton(type: .custom)
            btn.tag = i + 10
            btn.frame = CGRect(
                x: btnMargin + (btnMargin + btnWidth) * CGFloat(i), 
                y: margin, 
                width: btnWidth, 
                height: btnHeight
            )
            setupBtnStyle(btn)
            self.view.addSubview(btn)
            switch i {
            case 0:
                btn.setTitle("+", for: .normal)
            case 1:
                btn.setTitle("-", for: .normal)
            case 2:
                btn.setTitle("*", for: .normal)
            case 3:
                btn.setTitle("/", for: .normal)
            default:
                break
            }
        }
        // 9宫格的9 ~ 1
        for i in 0..<9 {
            let btn = UIButton(type: .custom)
            btn.tag = 9 - i
            btn.frame = CGRect(
                x: btnMargin + (btnMargin + btnWidth) * CGFloat(i % 3), 
                y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(i / 3), 
                width: btnWidth, 
                height: btnHeight
            )
            setupBtnStyle(btn)
            self.view.addSubview(btn)
            btn.setTitle("\(9 - i)", for: .normal)
        }
        // 0
        let btn0 = UIButton(type: .custom)
        btn0.tag = 0
        btn0.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(0), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(3), 
            width: btnWidth * 2 + btnMargin, 
            height: btnHeight
        )
        setupBtnStyle(btn0)
        self.view.addSubview(btn0)
        btn0.setTitle("0", for: .normal)
        // .
        let btnDot = UIButton(type: .custom)
        btnDot.tag = 10
        btnDot.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(2), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(3), 
            width: btnWidth, 
            height: btnHeight
        )
        setupBtnStyle(btnDot)
        self.view.addSubview(btnDot)
        btnDot.setTitle(".", for: .normal)

        // 清除按钮
        let btnClear = UIButton(type: .custom)
        btnClear.tag = 10
        btnClear.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(3), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(0), 
            width: btnWidth, 
            height: btnHeight + btnMargin
        )
        setupBtnStyle(btnClear)
        self.view.addSubview(btnClear)
        btnClear.setTitle("C", for: .normal)

        // =
        let btnEqual = UIButton(type: .custom)
        btnEqual.tag = 10
        btnEqual.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(3), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(1), 
            width: btnWidth, 
            height: btnHeight * 4 + btnMargin * 3
        )
        setupBtnStyle(btnEqual)
        self.view.addSubview(btnEqual)
        btnEqual.setTitle("=", for: .normal)
    }

    // 按钮样式和点击事件
    private func setupBtnStyle(_ btn: UIButton) {
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .highlighted)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
    }

    @objc private func btnClick(_ sender: UIButton) {
        print(sender.tag)
    }
}