//
//  ActorDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/07/23.
//

import SwiftUI

class User{
    
    let id : String
    let name : String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

actor UserStorage {
    
    private var store  = [String : User]()
    
    func  get(_ mid : String) ->  User? {
        
        return store[mid]
    }
    
    func save(_ user : User){
        
        store[user.id] = user
        
    }
    
    init(){
        
    }
}

struct ActorDemo2: View {
    
    
  
    var body: some View {
       
        
        Button {
            saveButtonClick()
        } label: {
            Text("Save".uppercased())
                .foregroundColor(.white)
                .font(.title2)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
              
                .background(
                    Color.accentColor
                       
                )
                .cornerRadius(15)
                .padding(.horizontal,15)
               
               
        }
    }
    
    func saveButtonClick() {
        
        Task {
            
            let user = User(id: "1", name: "AKO")
            
            let storage = UserStorage()
            
            
           await storage.save(user)
            print("Save Data")
            guard let  getId =  await storage.get("1") else {
                
                return
            }
        
            print("Get Data" ,String(describing: getId.name))
        }
        
        
    }
}

struct ActorDemo2_Previews: PreviewProvider {
    static var previews: some View {
        ActorDemo2()
    }
}
