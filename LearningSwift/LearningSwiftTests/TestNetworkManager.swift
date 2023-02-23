//
//  TestNetworkManager.swift
//  LearningSwiftTests
//
//  Created by Sniper on 2023/2/23.
//

import XCTest
@testable import LearningSwift

class TestNetworkManager: XCTestCase {

    var networkManager: NetworkManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomNumber() throws {
        let urlString = "https://www.randomnumberapi.com/api/v10.0/random?min=0&max=100&count=1"
        let url = URL(string: urlString)!

        let promise = expectation(description: "Status code: 404")

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else if statusCode == 404 {
                    XCTFail("Status code: \(statusCode)")
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }

        dataTask.resume()

        wait(for: [promise], timeout: 5)
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
