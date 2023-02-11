//
//  NetworkManager.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/11.
//

import Foundation
import Alamofire

enum NetworkResult<T> {
    case success(T)
    case failure(Error)
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func sendRequest<T: NetworkRequestProtocol>(_ data: T, completion: @escaping (NetworkResult<Data>) -> Void) {
        if data.useMockData { // 使用模拟数据
            completion(.success(data.mockDataResponse()))
            return
        }
        debugPrint("Request URL: \(data.url)")
        debugPrint("Request Method: \(data.method)")
        debugPrint("Request Headers: \(data.headers)")
        debugPrint("Request Parameters: \(data.parameters)")
        debugPrint("Request Use Mock Data: \(data.useMockData)")
        AF.request(data.url, method: HTTPMethod(rawValue: data.method), parameters: data.parameters, encoding: URLEncoding.default, headers: HTTPHeaders(data.headers)).response { response in
            if let error = response.error {
                debugPrint("Request Error: \(error)")
                completion(.failure(error))
            } else {
                let strData = String(data: response.data!, encoding: .utf8)
                debugPrint("Request Response: \(strData ?? "")")
                completion(.success(response.data!))
            }
        }
    }
}
