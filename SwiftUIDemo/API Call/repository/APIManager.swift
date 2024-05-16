//
//  APIService.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/05/24.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    // Add more methods as needed
}

enum APIErrors : Error {
    
    case custom(message : String)
    
              
}



enum ResultData : String {
    case success = "Scucess"
    case fail  = "Fail"

}



enum APIErrors1: Error {
    case statusCode(Int)
    case unknownResponse
    case decodingError(Error)
    case custom(message : String)
    
    var localizedDescription: String {
        switch self {
        case .statusCode(let code):
            return "API request failed with status code: \(code)"
        case .unknownResponse:
            return "Unknown response received from API"
        case .decodingError(let error):
            return "Error decoding data: \(error.localizedDescription)"
        case .custom(message: let message):
            return "\(message)"
        }
    }
}

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case serverError(statusCode: Int, message: String?)
    case unexpectedResponse
    case unexpectedError(Error)
    case custom(message: String)
}

class APIManager {
    
    
    static let shared = APIManager()
    
    private let tokenValue = "1234567890"
    private init() {}
    
    
    //Note : We added common header here...
    private func setDefaultHeaders(_ request: inout URLRequest) {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue(tokenValue, forHTTPHeaderField: "token")
            // Add other common headers here
        }
    
    func makeRequest(urlString: String, method: HTTPMethod, headers: [String: String]? = nil, body: Data? = nil) throws -> URLRequest {
            guard let url = URL(string: urlString) else {
                throw APIError.invalidURL
            }
            
        
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            setDefaultHeaders(&request)
            
            if let headers = headers {
                for (headerField, value) in headers {
                    request.addValue(value, forHTTPHeaderField: headerField)
                }
            }
            
            if let body = body {
                request.httpBody = body
            }
            
            return request
        }
}
