//
//  OTPSheetView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/02/24.
//

import Foundation
import SwiftUI

struct OTPSheetView: View {
    
    @ObservedObject var vm: OTPAlertViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                    
                    Text("Product")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                    
                    
                    ScrollView {
                        
                        VStack(alignment: .leading, spacing :10)
                        {
                            Text("Meals description")
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                            
                            
                            HStack(alignment: .center, spacing: 10, content: {
                                
                                Text("Price: ")
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                                
                                Text("240 Rs")
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                            })
                            
                            
                            
                            Text(vm.dynamicText) // Access dynamic text from view model
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                            
                                .fixedSize(horizontal: false, vertical: true)
                            
                            
                            
                        }
                        
                        .frame(maxWidth: .infinity, alignment: .leading) // Align content to leading
                        .padding(.horizontal)
                        
                    }
                    
                    Divider()
                        .background(Color.blue.opacity(0.4))
                        .padding([.bottom],20)
                    
                    HStack(alignment: .center, spacing: 0) { // Center button within its row
                        
                        Button(action: {
                            vm.isShowingDetails = false
                        }, label: {
                            APButton(title: "Done")
                        })
                        
                    }
                    
                        .padding(.bottom)
                
                
                ///
            }
            .frame(width: geometry.size.width, height: min(geometry.size.height, 280),alignment: .top) // Maximum height
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            
            
            
           
        }
    }
}


struct OTPSheetView_Previews: PreviewProvider {
    static var previews: some View {

        let vm: OTPAlertViewModel = OTPAlertViewModel()
        OTPSheetView(vm: vm)
    }
}
