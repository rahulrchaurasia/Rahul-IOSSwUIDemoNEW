//
//  ProfileViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 05/06/24.
//

import Foundation

enum ProfileField : Int, Hashable ,CaseIterable {
    
   case name
   case  email
   case mobileNo
   case phoneNo
   case address
   case refernce
    
}
@MainActor
class ProfileViewModel : ObservableObject {
    
    static var shared = ProfileViewModel()
    @Published var userResponse: UserResponse?
    
    @Published var isLoading: Bool = false
    
    @Published var showError = false
    @Published var errorMessage : String?
    
    @Published var txtName = String()
    @Published var txtEmail = String()
    @Published var txtMobile = String()
    @Published var txtPhone = String()
    @Published var txtRef = String()
    @Published var txtAdderess = String()
    @Published var selectedDate = Date()
    
    @Published var txtBankName = String()
    @Published var txtAccountHolderName = String()
    @Published var txtAccountNumber = String()
    
    @Published var isMale: Bool = false
    
    var isUserResponse : Bool = false

    // Errors for each text field
    @Published private(set)  var fieldErrors: [ProfileField: String] = [:]
    
    private let loginRepository: LoginRepositoryProtocol
    
    init( loginRepository: LoginRepositoryProtocol = LoginRepository.shared) {
      
        self.loginRepository = loginRepository
    }
    
    
    //MARK: Error Handling in Dictionary
      private func setError(for field: ProfileField, message: String) {
            fieldErrors[field] = message
        }

        func error(for field: ProfileField) -> String? {
            return fieldErrors[field]
        }

        func hasError(for field: ProfileField) -> Bool {
            return fieldErrors[field] != nil
        }
    
    //MARK: Action
    
    // Validate user inputs
      func validAction() -> Bool {
          if txtName.isEmpty {
              setError(message: "Please enter name")
              
              setError(for: .name, message: "Please enter name")
              return false
          }
          if txtEmail.isEmpty {
              setError(message: "Please enter email")
              setError(for: .email, message: "Please enter email")
              return false
          }
          if txtMobile.isEmpty {
              setError(message: "Please enter mobile")
              setError(for: .mobileNo, message: "Please enter mobile")
              return false
          }
          if txtMobile.count < 10 {
              setError(message: "Please enter valid mobile")
              setError(for: .mobileNo, message: "Please enter valid mobile")
              return false
          }
          if txtAdderess.isEmpty {
              setError(message: "Please enter address")
              setError(for: .address, message: "Please enter address")
              return false
          }
          return true
      }
    
    func validAction1() -> Bool {
          fieldErrors = [:] // Reset errors before validation

          if txtName.isEmpty {
              setError(for: .name, message: "Please enter name")
          } else if txtEmail.isEmpty {
              setError(for: .email, message: "Please enter email")
          } else if txtMobile.isEmpty {
              setError(for: .mobileNo, message: "Please enter mobile")
          } else if txtMobile.count < 10 {
              setError(for: .mobileNo, message: "Please enter valid mobile")
          } else if txtPhone.isEmpty {
              setError(for: .phoneNo, message: "Please enter phone number")
          } else if txtAdderess.isEmpty {
              setError(for: .address, message: "Please enter address")
          } else if txtRef.isEmpty {
              setError(for: .refernce, message: "Please enter reference")
          }
        
//           if !fieldErrors.isEmpty {
//                 // Show the first error in the alert
//                 let firstError = fieldErrors.first!
//                 errorMessage = firstError.value
//                 showError = true
//             } else {
//                 showError = false
//            }

             if let firstError = fieldErrors.first {
                   // Safely unwrap the first error and use it
                   errorMessage = firstError.value
                   showError = true
               } else {
                   showError = false
               }
               
          // Return true if no errors are found
          return fieldErrors.isEmpty
      }
    
    // Helper to set error messages
       private func setError(message: String) {
           self.errorMessage = message
           self.showError = true
           
           
       }
    
    //reset Data
    func resetFields() {
            txtName = ""
            txtEmail = ""
            txtMobile = ""
            txtPhone = ""
            txtAdderess = ""
            txtRef = ""
            fieldErrors = [:]
            errorMessage = nil
            showError = false
        }
    
   
    //MARK: Api Call
    //***************************************************
    func fetchUserData1(email: String) async throws  {
        
            isLoading = true
            errorMessage = ""
         
        
            defer { isLoading = false }

            do {
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 100) {
                    self.isLoading = false
                }
        
               // return .success(userResponse)
            } catch {
                print("OTP  reponse Fail ")
              
               
            }
        }
    
    func fetchUserData(email: String) async throws  {
            isLoading = true
            errorMessage = nil
           // userResponse = nil
        
            defer { isLoading = false }

            do {
                let userResponse = try await loginRepository.fetchUserData(email: email)
                
                if let userResponse = userResponse {
                    
                    self.userResponse = userResponse
                    isUserResponse = true
                    print("OTP  reponse Success ",userResponse )
                    
                    showError = true
                    errorMessage = "Data Fetch Successfully..!"
                }
        
               // return .success(userResponse)
            } catch {
                print("OTP  reponse Fail ")
                isUserResponse = false
                showError = true
                errorMessage = handleError(error: error)
            }
        }
    
      func handleError(error: Error) -> String {
            if let apiError = error as? APIError {
                return apiError.localizedDescription
            } else {
                return error.localizedDescription
            }
        }

   
   
}
