//
//  APIService.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/05/24.
//

import Foundation


enum APIError: Error {
       case invalidURL
        case noData
//        case invalidResponse
//        case clientError(statusCode: Int)
//        case serverError(message: String)
//        case decodingError(message: String)
//        case unexpectedStatusCode(code: Int)
    
        
        case networkError(error: Error)
        case decodingError(error: Error)
        case serverError(statusCode: Int, message: String?)
        case unexpectedResponse
        case unexpectedError(error: Error)
        case custom(message : String)
}
class APIManager {
    
    
    static let shared = APIManager()
    
    
    private init() {}
    
    func makeRequest(urlString: String, method: String, headers: [String: String], body: Data?) throws -> URLRequest {
            guard let url = URL(string: urlString) else {
                throw APIError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = method
            
            for (headerField, value) in headers {
                request.addValue(value, forHTTPHeaderField: headerField)
            }
            
            if let body = body {
                request.httpBody = body
            }
            
            return request
        }
}
