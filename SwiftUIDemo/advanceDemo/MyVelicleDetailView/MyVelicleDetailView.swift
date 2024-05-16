//
//  MyVelicleDetailView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 13/05/24.
//

import SwiftUI

struct MyVelicleDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var vm = MyVehicleDetailViewModel.shared
    
    var body: some View {
        ZStack{
            
            VStack(spacing :0){
                
                ZStack{
                    
                    VStack{
                        
                        Text("Toyta Prius")
                            .font(.customfont(.extraBold, fontSize: 25))
                            .foregroundStyle(Color.primaryText)
                        
                        Text("AB 1234")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundStyle(Color.secondaryText)
                    }
                    
                    HStack{
                        
                        Button(action: {
                           
                            dismiss()
                            
                        }, label: {
                            Image("close")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        })
                        
                        Spacer()
                      
                    }
                  
                }
                .padding(.top,.topInsets)
                .padding(.leading,30)
                .padding(.bottom,10)
                
                Group{
                    
                    Divider()
                    Rectangle()
                        .fill(Color.lightWhite)
                        .frame(height: 8)
                }
                
                
                List{
                    
                    ForEach(vm.MyVehicleDetialList ) { vehicleObj in
                        
                       VehicleDocumentRow(vehicleObj: vehicleObj)
                    }
                }
                .listStyle(.plain)
                .scrollIndicatorsCustomModifier()
                
                Spacer()
            }
            .padding(.bottom ,.bottomInsets)
        }
        .task {
            
            debugPrint(" task triggered.... Used For Asyncronous Operation")
           
            vm.getVehicleDetail()
        }
        .onAppear(){
            debugPrint(" onAppear triggered....Used For Syncronous Operation")
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
       
    }
}

#Preview {
    MyVelicleDetailView()
}
