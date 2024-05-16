//
//  UserResponse.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/05/24.
//

import Foundation


struct UserResponse: Codable {
    let Message, Status: String
    let StatusNo: Int
    let MasterData: UserMasterData

    
}

// MARK: - MasterData
struct UserMasterData: Codable {
    let food_id: Int
    let username, email, password, location: String
    let create_date: String
    let SavedStatus: Int
    let Message: String

    
}
