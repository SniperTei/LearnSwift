//
//  TestNetworkManager.swift
//  LearningSwiftTests
//
//  Created by Sniper on 2023/2/23.
//

import XCTest
@testable import LearningSwift

struct TestData: NetworkRequestProtocol {
    var method: String
    
    // 接口地址
    var url: URL = URL(string: "https://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1")!
    var parameters: [String : Any] = [
            "app_id": ConstEncryptValues.everydayWordAppId,
            "app_secret": ConstEncryptValues.everydayWordAppSecret,
            "count":4]
    var headers: [String : String] = [:]
}

class TestNetworkManager: XCTestCase {

    var data: TestData!
    var networkManager: NetworkManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        data = TestData(method: "GET")
        networkManager = NetworkManager.shared

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomNumber() throws {
        // let urlString = "https://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
        // let url = URL(string: "https://www.randomnumberapi.com/test")! 404的
        // let url = URL(string: urlString)!

        // let promise = expectation(description: "Status code: 404")
        let promise = expectation(description: "Status code: 200")

        networkManager.sendRequest(data) { (result) in
            switch result {
            case .success(let data):
                print("data: \(data)")
//                XCTFail("data: \(data)")
                promise.fulfill()
            case .failure(let error):
                print("error: \(error)")
//                 promise.fulfill()
                XCTFail("error: \(error)")
            }
        }

        wait(for: [promise], timeout: 30)
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
