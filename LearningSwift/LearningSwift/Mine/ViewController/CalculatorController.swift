//
//  CalculatorController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/28.
//

import Foundation
import UIKit

class CalculatorController: BaseViewController {

    var result: Double = 0
    let calculator = Calculator<Double>()
    var num0: Double = 0.0
    var num1: Double = 0.0
    var tempNum: String = "0"
    var operString: String = "="
    var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        let calculator = Calculator<Double>()
        let result = calculator.addTo(1)(2)
        print("result \(result)")
        
        let result2 = calculator.addTo(1) >>> calculator.multiplyBy(2) >>> calculator.divideBy(3) >>> calculator.subtractFrom(4)
        print("result2 \(result2(5))")
    }

    private func setupUI() {

        textLabel = UILabel()
        textLabel.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 100)
        textLabel.textAlignment = .right
        textLabel.text = "0"
        textLabel.font = UIFont.systemFont(ofSize: 50)
        self.view.addSubview(textLabel)

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
        btnDot.tag = 14
        btnDot.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(2), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(3), 
            width: btnWidth, 
            height: btnHeight
        )
        setupBtnStyle(btnDot)
        self.view.addSubview(btnDot)
        btnDot.setTitle(".", for: .normal)
        btnDot.isHidden = true

        // 清除按钮
        let btnClear = UIButton(type: .custom)
        btnClear.tag = 15
        btnClear.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(3), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(0), 
            width: btnWidth, 
            height: btnHeight
        )
        setupBtnStyle(btnClear)
        self.view.addSubview(btnClear)
        btnClear.setTitle("C", for: .normal)

        // =
        let btnEqual = UIButton(type: .custom)
        btnEqual.tag = 16
        btnEqual.frame = CGRect(
            x: btnMargin + (btnMargin + btnWidth) * CGFloat(3), 
            y: margin + btnHeight + btnMargin + (btnMargin + btnHeight) * CGFloat(1), 
            width: btnWidth, 
            height: btnHeight * 3 + btnMargin * 2
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
        switch sender.tag {
        // 10 11 12 13 是加减乘除
        case 10:
            if result != 0 {
                num0 = result
                result = 0
            }
            if num0 == 0 {
                num0 = Double(tempNum)!
                textLabel.text = String(num0)
            } else {
                num1 = Double(tempNum)!
                calculate()
                textLabel.text = String(num0) + "+" + String(num1)
            }
            operString = "+"
            tempNum = ""
        case 11:
        if result != 0 {
                num0 = result
                result = 0
            }
            if num0 == 0 {
                num0 = Double(tempNum)!
                textLabel.text = String(num0)
            } else {
                num1 = Double(tempNum)!
                calculate()
                guard let text = textLabel.text else { return }
                textLabel.text = String(num0) + "-" + String(num1)
            }
            operString = "-"
            tempNum = ""
        case 12:
            if result != 0 {
                num0 = result
                result = 0
            }
            if num0 == 0 {
                num0 = Double(tempNum)!
                textLabel.text = String(num0)
            } else {
                num1 = Double(tempNum)!
                calculate()
                guard let text = textLabel.text else { return }
                textLabel.text = textLabel.text! + "*" + String(num1)
            }
            operString = "*"
            tempNum = ""
        case 13:
        if result != 0 {
                num0 = result
                result = 0
            }
            if num0 == 0 {
                num0 = Double(tempNum)!
                textLabel.text = String(num0)
            } else {
                num1 = Double(tempNum)!
                calculate()
                guard let text = textLabel.text else { return }
                textLabel.text = textLabel.text! + "/" + String(num1)
            }
            operString = "/"
            tempNum = ""
        case 14:
            // 14是小数点
            print(".")
        case 15:
            // 15是清除
            print("C")
            operString = "="
            tempNum = ""
            num0 = 0
            num1 = 0
            textLabel.text = "0"
            result = 0
        case 16:
            // 16是等于
            print("=")
            num1 = Double(tempNum)!
            calculate()
            // print("num0 = \(num0) \(operString) num1 = \(num1) = \(result)")
            print("result = \(result)")
            guard let text = textLabel.text else { return }
            textLabel.text = String(num0) + operString + String(num1) + "=" + String(result)
            operString = "="
            tempNum = "0"
            print("result = \(result)")
        default:
            // 0 ~ 9
            if operString == "=" {
                tempNum = "0"
                num0 = 0
                num1 = 0
            }
            print(sender.tag)
            tempNum = tempNum + String(sender.tag)
            print("tempNum = \(tempNum)")
            textLabel.text = String(tempNum)
        }
    }

    func calculate() {
        print("num0 : \(num0) \(operString) num1 : \(num1))")
        if operString == "+" {
            result = calculator.addTo(num1)(num0)
        } else if operString == "-" {
            result = calculator.subtractFrom(num1)(num0)
        } else if operString == "*" {
            result = calculator.multiplyBy(num1)(num0)
        } else if operString == "/" {
            result = calculator.divideBy(num1)(num0)
        }
        // result = num0
        print("= \(result)")
    }
}
