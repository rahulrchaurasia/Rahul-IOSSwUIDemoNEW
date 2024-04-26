//
//  Nested2ListDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/01/24.
//

import SwiftUI

// demo :-- https://www.youtube.com/watch?v=CmzXYTEv3KM


struct Nested2ListDemo: View {
    
    @StateObject var vm = NestedListViewModel()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        ZStack{
            

            ScrollView( showsIndicators: false){
                VStack(alignment: .leading, spacing: 15) {
                   
                    HStack{
                        Text("Disclosure")
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                            .padding([.top,.horizontal])
                        Spacer()
                        
                           
                        Button(action: {
                            
                            handleDismissAll()
                            
                        }, label: {
                           Image("close")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22,height: 22)
                                .padding(.trailing,10)
                            
                        })
                    }
                   
                    
                    
                    ForEach(vm.items){ item in
                        
                        DisclosureGroup(
                            content: {
                            
                                if let subItemData = item.subItem {
                                 
                                    VStack(spacing: 0)
                                    {
                                        
                                        ForEach(subItemData) { subItem in
                                            
                                            NestedRowItem(subData: subItem)
                                            
                                            
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                           .padding()
                                           // Apply background here:
                                           .background(Color.bg.opacity(0.3))
                                           .cornerRadius(10)
                                    
                                    
                                    
                                }
                                    
                                   
                            },
                            label: {
                                VStack{
                                    Text(item.title)
                                        .font(.title2)
                                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
                                   
                                }
                               
                                
                            }
                        )
                      
                        .tint(.orange)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.mint.opacity(0.1))
                           
                        
                        )
                       
                        
                       
                        
                    }
                    
                    

                }
                .frame( maxHeight: .infinity, alignment: .top)
                .padding()
                
            }
           
            .padding(.top, .topInsets)
            
        
            .overlay(alignment: .top) {
               
               
                   Color.primaryApp
                    .frame(height: .topInsets)
                    .ignoresSafeArea(.all,edges: .top)
            }
           
         
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    
       
    }
}


private extension Nested2ListDemo {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
}
#Preview {
    Nested2ListDemo()
}
