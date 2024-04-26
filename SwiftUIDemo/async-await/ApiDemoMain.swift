//
//  ApiDemoMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 16/02/24.
//

import SwiftUI

struct ApiDemoMain: View {
    var body: some View {
        ZStack{
           
            Color(UIColor.customred).opacity(0.2)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                
                VStack {
                    
                    ApiDemo1
                    
                    ApiDemo2
                    
                   
                }.padding(.top,10)
            }
           
           
           
            
        }
        .navigationTitle("Home")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    print("Done")
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
            }
        }
    }
}

extension ApiDemoMain {
    
    //Geometry Demo
    var ApiDemo1: some View  {
        
        Group {
            
            // Advance Demo
            CustomButton1(name: "Api Demo", imgName: "folder.badge.plus") {
                print("")
            }.padding(.horizontal,40)
        }
        
    }
    
    //Geometry Demo
    var ApiDemo2: some View  {
        
        Group {
           
            // Advance Demo
            NavigationLink {
                GeometryDemo2()
                  
            } label: {
                Text("Geometry demo 2")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(UIColor.customdarkGreen))
                    .cornerRadius(15)
                    
            }
         
        }
        
    }
    
    

               

        

}

#Preview {
    ApiDemoMain()
}
