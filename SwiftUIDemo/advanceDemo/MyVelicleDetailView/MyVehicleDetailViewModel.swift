//
//  MyVehicleDetailViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/05/24.
//

import Foundation
import SwiftUI


class MyVehicleDetailViewModel : ObservableObject {
    
    @Published var MyVehicleDetialList : [VehicleDetail] = []
    
    static let shared = MyVehicleDetailViewModel()
    private  init() {
       
    }
    
    func getVehicleDetail() {
        
        self.MyVehicleDetialList.removeAll()
        
      
        MyVehicleDetialList.append(contentsOf: [
            VehicleDetail(name: "Vehicle Registration",
                          descrition: "Vehicle Registration",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,

            VehicleDetail(name: "Vehicle Insurance",
                          descrition: "Expires: 22 Nov 2025",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Permit",
                          descrition: "Expires: 27 Nov 2025",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Loan EMI Details",
                          descrition: "Incorrect document type",
                          status: "NOT APPROVED",
                          status_color: Color.redApp) ,
            
            VehicleDetail(name: "Vehicle Personal  Details",
                          descrition: "correct document type",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Permit Deny",
                          descrition: "correct document type",
                          status: "NOT APPROVED",
                          status_color: Color.redApp) ,
            
            
            
            VehicleDetail(name: "Vehicle Insurance Part",
                          descrition: "Expires: 22 Nov 2025",
                          status: "NOT APPROVED",
                          status_color: Color.redApp) ,
            
            VehicleDetail(name: "Vehicle Permit Denny",
                          descrition: "Expires: 27 Nov 2025",
                          status: "NOT APPROVED",
                          status_color: Color.redApp) ,
            
            VehicleDetail(name: "Motor Loan EMI Details",
                          descrition: "Incorrect document type",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Personal  Details",
                          descrition: "correct document type",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Permit Accept",
                          descrition: "correct document type",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Personal  Details",
                          descrition: "correct document type",
                          status: "APPROVED",
                          status_color: Color.primaryApp) ,
            
            VehicleDetail(name: "Vehicle Permit Deny",
                          descrition: "correct document type",
                          status: "NOT APPROVED",
                          status_color: Color.redApp) 
            
            
        ])
        
    }
    
    
    
}

struct VehicleDetail : Identifiable{
    let id = UUID().uuidString
    var name : String
    var descrition : String?
    var status : String?
    var status_color : Color?
    
}
