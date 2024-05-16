//
//  VehicleDocumentRow.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/05/24.
//

import SwiftUI

struct VehicleDocumentRow: View {
    
    let vehicleObj : VehicleDetail
    
    
    var body: some View {
        
       
       
        HStack( spacing :0){
            
            VStack(alignment: .leading){
                
                Text(vehicleObj.name)
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundStyle(Color.primaryText)
                
                
                Text(vehicleObj.descrition ?? "")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundStyle(Color.secondaryText)
            }
            
            Spacer()
            
           
                
            
            Text(vehicleObj.status ?? "")
                .font(.customfont(.semibold, fontSize: 10))
                .foregroundStyle(getStatusColor())
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(  getStatusColor().opacity(0.3) )
                .overlay {
                    
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(getStatusColor(), lineWidth: 1)
                    
                       
                }
                .cornerRadius(5, corner: .allCorners)
            
               
            
        }
    }
    
    func getStatusColor() -> Color{
        
        if(vehicleObj.status_color == Color.primaryApp){
            return Color.primaryApp
        }else{
            return Color.redApp
        }
       
    }
}



struct VehicleDocumentRow_Previews: PreviewProvider {
    static var previews: some View {
        let vehicleObj: VehicleDetail = VehicleDetail(name: "Vehicle Loan EMI Details", descrition: "Incorrect document type , Metalic Body", status: "APPROVED", status_color: Color.redApp )
        VehicleDocumentRow(vehicleObj: vehicleObj)
    }
}
