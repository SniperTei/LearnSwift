//
//  Calculator.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/21.
//

import Foundation

class Calculator {
    // +
    func addTo(_ num: Int) -> (Int) -> Int {
        return { num + $0 }
    }
    // -
    func subtractFrom(_ num: Int) -> (Int) -> Int {
        return { num - $0 }
    }
    // *
    func multiplyBy(_ num: Int) -> (Int) -> Int {
        return { num * $0 }
    }
    // /
    func divideBy(_ num: Int) -> (Int) -> Int {
        return { num / $0 }
    }
    // 
    func calculate(_ num: Int, by operation: (Int) -> Int) -> Int {
        return operation(num)
    }
}