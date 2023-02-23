//
//  Calculator.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/21.
//

import Foundation

class Calculator<T: FloatingPoint> {
    // +
    func addTo(_ num: T) -> (T) -> T {
        return { $0 + num }
    }
    // -
    func subtractFrom(_ num: T) -> (T) -> T {
        return { $0 - num }
    }
    // *
    func multiplyBy(_ num: T) -> (T) -> T {
        return { $0 * num }
    }
    // /
    func divideBy(_ num: T) -> (T) -> T {
        return { $0 / num }
    }
}

// 自定义运算符 >>>
infix operator >>>: AdditionPrecedence
// 支持任意类型的>>>
func >>> <T>(_ left: @escaping (T) -> T, _ right: @escaping (T) -> T) -> (T) -> T {
    return {
        print("$0 \($0)")
        let result = left($0)
        print("result \(result)")
        return right(result)
    }
}
