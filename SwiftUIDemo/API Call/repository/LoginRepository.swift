//
//  LoginRepository.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/05/24.
//

import Foundation


final class LoginRepository : LoginRepositoryProtocol{
    
    
    
    static let shared = LoginRepository()
    
    private init() {
           // Private initializer to prevent external instantiation
    }
   
    private func mapError(_ error: Error) -> APIError {
            // Map specific errors to API errors, or return a generic error
            // ...
            return APIError.unexpectedError(error)
        }
    
    
    func fetchUserData(email: String) async throws -> UserResponse? {
           let endUrl = "/quote/Postfm/food_getuser"
           let urlString = Configuration.baseROOTURL + endUrl

           let userData = ["email": email]
           guard let jsonData = try? JSONSerialization.data(withJSONObject: userData) else {
               throw APIError.custom(message: "Failed to encode user data")
           }

           let urlRequest = try APIManager.shared.makeRequest(urlString: urlString, method: .post, body: jsonData)

           do {
               let (data, response) = try await URLSession.shared.data(for: urlRequest)
               guard let httpResponse = response as? HTTPURLResponse else {
                   throw APIError.unexpectedResponse
               }

               if httpResponse.statusCode != 200 {
                   throw APIError.serverError(statusCode: httpResponse.statusCode, message: nil)
               }

               let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
               return userResponse
           } catch {
               throw mapError(error)
           }
       }
    
    func getLoginUserData(email : String)  async throws ->(result: UserResponse?, status : String) {
        
        var Status = ""
        
         let endUrl = "/quote/Postfm/food_getuser"
         let urlString = Configuration.baseROOTURL + endUrl
        
        do {
            
            let userData = ["email" : email]
            
            let jsonData = try JSONSerialization.data(withJSONObject: userData)
            debugPrint("Request:-", jsonData)
           
            
            let urlRequest = try APIManager.shared.makeRequest(urlString: urlString, method: .post,body: jsonData)
            
            
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.unexpectedResponse
            }
            
            if httpResponse.statusCode != 200 {
                
                // Create an appropriate error based on status code and optional message
                throw APIError.unexpectedResponse
                
            }
            
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                if let _status = jsonObject["Status"] as? String {
                    print("status",_status )
                    Status = _status
                    
                    
                    if(Status.lowercased()  == "success"){
                       
                        // fetch Response
                    let userResponse = try? JSONDecoder().decode(UserResponse.self, from: data)
                        
                        return(userResponse,"0")
                        
                    }

                }else{
                    return(nil,"1")
                }
                
            }
        }
        
        return (nil,"1")
    }
    
    
   

}
