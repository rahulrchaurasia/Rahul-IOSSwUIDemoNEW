//
//  SupportViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/05/24.
//

import Foundation


 class SupportViewModel: ObservableObject {
    
    static let shared = SupportViewModel()
  
     private init(){
           
        
        
     }
    
   
    
    @Published var userArr: [UserProfile] = []
    @Published var messageArr: [MessageModel] = []
    
    @Published var txtMessage = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    
   
    @Published var showMessage = false
    
    
    
    func addUser() {
        
        self.userArr.removeAll()
        
      
        userArr.append(contentsOf: [
              UserProfile(id: 1, name: "Rahul", message: "Android Developer", baseCount: "34000Rs", createdDate: "2-Jan-2021"),
              UserProfile(id: 2, name: "Umesh", message: "ReactNative Developer", baseCount: "220000Rs", createdDate: "2-Jan-2021"),
              UserProfile(id: 3, name: "Pankaj", message: "Android Developer", baseCount: "4700Rs", createdDate: "2-Jan-2021"),
              UserProfile(id: 4, name: "Shailesh", message: "ReactNative Developer", baseCount: "4000Rs", createdDate: "2-Jan-2021"),
              
              
              UserProfile(id: 5, name: "acc", message: "Android Developer", baseCount: "34000Rs", createdDate: "2-Jan-2021"),
              UserProfile(id: 6, name: "ggg", message: "ReactNative Developer", baseCount: "220000Rs", createdDate: "2-Jan-2021"),
              UserProfile(id: 7, name: "yyy", message: "Android Developer", baseCount: "4700Rs", createdDate: "2-Jan-2021"),
              UserProfile(id: 8, name: "kkk", message: "ReactNative Developer", baseCount: "4000Rs", createdDate: "2-Jan-2021")
            ])
        
    }
    
    
    //MARK: ServiceCall
    
   
    
}



struct MessageModel: Identifiable, Equatable {
        
        var id: Int = 0
        var senderId: Int = 0
        var receiverId: Int = 0
        var message: String = ""
        var createdDate: Date = Date()
        
        init(mObj: NSDictionary) {
            id = mObj.value(forKey: "chat_id") as? Int ?? 0
            senderId = mObj.value(forKey: "sender_id") as? Int ?? 0
            receiverId = mObj.value(forKey: "receiver_id") as? Int ?? 0
            message = mObj.value(forKey: "message") as? String ?? ""
           
        }
        
        static func == (lhs: MessageModel, rhs: MessageModel) -> Bool {
            return lhs.id == rhs.id
        }
}




struct UserProfile {
    let id: Int
    let name: String
    let message: String // Optional for potentially empty message
    let baseCount: String // Assuming baseCount represents a number
    let createdDate: String
}
