//
//  LoginRepository.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/05/24.
//

import Foundation


final class LoginRepository {
    
    
    func getotpLoginHorizon(email: String) async throws -> (String ,String,String) {
        
        var Mobile_No = ""
        var Status = ""
        var Ss_Id = ""

        let endUrl = "/quote/Postfm/food_getuser"
        let urlString =  Configuration.baseROOTURL  + endUrl
        
        guard let url = URL(string: urlString) else {
         
            throw APIError.invalidURL
        }
        
        // Set the "token" header
        let tokenValue = "1234567890"
      
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(tokenValue, forHTTPHeaderField: "token")
        debugPrint("URL :-", urlString)
        
        let apiReq: [String: Any] = [
                        
                        "login_id": email ,
                         ]
               
                do {
                       let jsonData = try JSONSerialization.data(withJSONObject: apiReq)
                       debugPrint("Request:-", jsonData)
                       request.httpBody = jsonData
                   } catch {
                       print(error.localizedDescription)
                   }

        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
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
                    
                }
                if let msgDict = jsonObject["Msg"] as? [String: Any] {
                    
                    if let _mobileNo = msgDict["Mobile_No"] as? NSNumber {
                        print("OTP Mobile_No",_mobileNo )
                        Mobile_No = _mobileNo.stringValue
                        
                    }
                    if let _ss_Id = msgDict["Ss_Id"] as? NSNumber {
                        print("OTP Ss_Id",_ss_Id )
                        Ss_Id = _ss_Id.stringValue
                        
                    }
                }
               
            }
        } catch {
            // Handle errors during the network request
            
            throw APIError.unexpectedError(error: error)
           
        }
        return (Status,Mobile_No,Ss_Id)
    }

}
