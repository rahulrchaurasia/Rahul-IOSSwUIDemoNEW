//
//  ClosureDemoMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI

struct ClosureDemoMain: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
          
                NavigationLink {
                    ClosureDemo1()
                } label: {
                    Text("Closure No Param")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(15)
                        
                }
                
                
                
            NavigationLink {
                ClosureDemo2()
            } label: {
                Text("Closure With Param")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.skyblue)
                    .cornerRadius(15)
                    
            }
            
            NavigationLink {
                ClosureDemo3()
            } label: {
                Text("Closure With Param2")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.purple.opacity(0.7))
                    .cornerRadius(15)
                    
            }
            
            NavigationLink {
                ClosureDemo4()
            } label: {
                Text("Get Child List Slected Data")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)
                    
            }
            
            
            NavigationLink {
                SingleSelectionViewDemo2()
            } label: {
                Text("Single Slection 2 - Demo2")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.red.opacity(0.7))
                    .cornerRadius(15)
                    
            }
            NavigationLink {
                MultiSelectionViewDemo2()
            } label: {
                Text("MultiSlected Best - Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.orange.opacity(0.7))
                    .cornerRadius(15)
                    
            }
            NavigationLink {
                MultiSelectionViewDemo()
            } label: {
                Text("Multi Slection - Demo1")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.orange.opacity(0.7))
                    .cornerRadius(15)
                    
            }
            //MultiSelectionViewDemo
//
            
//                
//                NavigationLink {
//                     ContactsDetailView()
//                } label: {
//                    Text("Contact Demo")
//                        .padding(12)
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .background(.pink.opacity(0.7))
//                        .cornerRadius(15)
//                        
//                }
                
                
            
            
           Spacer()
        }.padding(.top,10)
    }
}

struct ClosureDemoMain_Previews: PreviewProvider {
    static var previews: some View {
        ClosureDemoMain()
    }
}
