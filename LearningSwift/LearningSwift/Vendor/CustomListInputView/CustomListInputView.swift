//
//  CustomListInputView.swift
//  LearningSwift
//
//  Created by Sniper on 2023/3/4.
//

import Foundation
import UIKit

class CustomListInputView: UIView {
    // 初始化
    init(title: String, list: [String]) {
        super.init(frame: .zero)
        
        self.titleLabel.text = title
        self.list = list
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 数据源
    private var list: [String] = []

    // UI
    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        // 取消
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(toolBarCancelButtonAction))
        // 空白
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // 确定
        let doneButton = UIBarButtonItem(title: "确定", style: .plain, target: self, action: #selector(toolBarDoneButtonAction))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }()
    // 标题
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "标题"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    // 选中的行
    private var selectedRow: Int = 0

    //  选中回调
    var customListInputViewDidSelect: ((Int) -> Void)?

    private func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(self.titleLabel)
        self.addSubview(self.pickerView)
        self.addSubview(self.toolBar)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
        }
        
        self.pickerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(200)
        }
        
        self.toolBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
}

extension CustomListInputView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
    }
}

extension CustomListInputView {
    @objc private func toolBarCancelButtonAction() {
        customListInputViewDidSelect?(-1)
        self.removeFromSuperview()
    }
    
    @objc private func toolBarDoneButtonAction() {
        customListInputViewDidSelect?(self.selectedRow)
        self.removeFromSuperview()
    }
}
