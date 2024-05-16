//
//  LoginViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/05/24.
//

import Foundation

@MainActor
class LoginViewModel : ObservableObject {
    
    
    @Published var isLoading: Bool = false
    @Published var userResponse: UserResponse?
        
    @Published var errorMessage: String?
    @Published var showSuccessAlert = false
    
    var isUserResponse : Bool = false
    
    //Mark : For OTP
    @Published var showOTP = false
    
    @Published var txtCode: String = ""
    
    //end
    
    private let loginRepository: LoginRepositoryProtocol
    
    init( loginRepository: LoginRepositoryProtocol = LoginRepository.shared) {
      
        self.loginRepository = loginRepository
    }
    
    
    func fetchUserData(email: String) async throws  {
            isLoading = true
            errorMessage = nil
            userResponse = nil
        
            defer { isLoading = false }

            do {
                let userResponse = try await loginRepository.fetchUserData(email: email)
                
                if let userResponse = userResponse {
                    
                    self.userResponse = userResponse
                    isUserResponse = true
                    print("OTP  reponse Success ",userResponse )
                }
        
               // return .success(userResponse)
            } catch {
                print("OTP  reponse Fail ")
                isUserResponse = false
                if let apiError = error as? APIError {
                    errorMessage = apiError.localizedDescription
                } else {
                    errorMessage = error.localizedDescription
                }
            }
        }
   
    func getLoginUserData(email : String) async throws -> Result<ResultData, APIErrors>{
        
        isLoading.toggle()
        
        defer {
            isLoading.toggle()
        }
        Task {
            
            do{
                let response = try await LoginRepository.shared.getLoginUserData(email: email)
                
                isUserResponse = true
                print("OTP  reponse Success ",response)
                
            }catch {
                
                isLoading = false
                isUserResponse = false
                print("OTP  reponse Fail ")
               // return .failure(.custom(message: serverUnavailbleError ))
                
            }
            
           
        }
        return .success(ResultData.success)
        
       
            
    }
}
