//
//  TestCalculator.swift
//  LearningSwiftTests
//
//  Created by Sniper on 2023/2/23.
//

import XCTest
@testable import LearningSwift

class TestCalculator: XCTestCase {

    var sut: Calculator<Double>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()

    }
    
    func testAddTo() {
        let result = sut.addTo(5)(3)
        XCTAssertEqual(result, 8)

        let result2 = sut.addTo(50)(-300)
        XCTAssertEqual(result2, -250)
    }

    func testSubtractFrom() {
        let result = sut.subtractFrom(5)(3)
        XCTAssertEqual(result, -2)

        let result2 = sut.subtractFrom(50)(-300)
        XCTAssertEqual(result2, -350)
    }

    func testMultiplyBy() {
        let result = sut.multiplyBy(5)(3)
        XCTAssertEqual(result, 15)

        let result2 = sut.multiplyBy(5)(0)
        XCTAssertEqual(result2, 0)

        let result3 = sut.multiplyBy(0)(3)
        XCTAssertEqual(result3, 0)

        let result4 = sut.multiplyBy(50)(-300)
        XCTAssertEqual(result4, -15000)
    }

    func testDivideBy() {
        let result = sut.divideBy(5)(3)
        XCTAssertEqual(result, 0.6)

        let result2 = sut.divideBy(5)(0)
        XCTAssertEqual(result2, 0)

        let result3 = sut.divideBy(0)(3)
        XCTAssertEqual(result3, 3)
    }

    func testAddToSubtractFrom() {
        let result = sut.addTo(5) >>> sut.subtractFrom(2)
        XCTAssertEqual(result(3), 6)

    }

    func testAddToMultiplyBy() {
        let result = sut.addTo(5) >>> sut.multiplyBy(2)
        XCTAssertEqual(result(3), 16)
    }

    func testAddToDivideBy() {
        let result = sut.addTo(5) >>> sut.divideBy(2)
        XCTAssertEqual(result(3), 4)
    }

    func testSubtractFromAddTo() {
        let result = sut.subtractFrom(5) >>> sut.addTo(2)
        XCTAssertEqual(result(3), 0)
    }

    func testSubtractFromMultiplyBy() {
        let result = sut.subtractFrom(5) >>> sut.multiplyBy(2)
        XCTAssertEqual(result(3), -4)
    }

    func testSubtractFromDivideBy() {
        let result = sut.subtractFrom(5) >>> sut.divideBy(2)
        XCTAssertEqual(result(3), -1)
    }

    func testMultiplyByAddTo() {
        let result = sut.multiplyBy(5) >>> sut.addTo(2)
        XCTAssertEqual(result(3), 17)
    }

    func testMultiplyBySubtractFrom() {
        let result = sut.multiplyBy(5) >>> sut.subtractFrom(2)
        XCTAssertEqual(result(3), 13)
    }

    func testMultiplyByDivideBy() {
        let result = sut.multiplyBy(5) >>> sut.divideBy(2)
        XCTAssertEqual(result(3), 7.5)
    }

    func testDivideByAddTo() {
        let result = sut.divideBy(5) >>> sut.addTo(2)
        XCTAssertEqual(result(3), 2.6)
    }

    func testDivideBySubtractFrom() {
        let result = sut.divideBy(5) >>> sut.subtractFrom(2)
        XCTAssertEqual(result(3), -1.4)
    }

    func testDivideByMultiplyBy() {
        let result = sut.divideBy(5) >>> sut.multiplyBy(2)
        XCTAssertEqual(result(3), 1.2)
    }

    // 测试10以上的复杂运算
    func testComplex() {
        let result = sut.addTo(50) >>> sut.subtractFrom(20) >>> sut.multiplyBy(44) >>> sut.divideBy(2)
        XCTAssertEqual(result(300), 7260)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
