//
//  GeometryReaderMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/12/23.
//

/*
 
 //https://www.rootstrap.com/blog/how-to-use-geometryreader-in-swiftui
 */
import SwiftUI

struct GeometryReaderMain: View {
    var body: some View {
        ZStack{
           
            Color(.skyblue)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                
                VStack {
                    
                    GeometryReaderDemo1
                    
                    GeometryReaderDemo2
                    
                    GeometryReaderDemo4
                    
                    GeometryReaderDemo5
                
                    GeometryReaderDemo6
                    
                    GeometryReaderDemo7
                   
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

extension GeometryReaderMain {
    
    //Geometry Demo
    var GeometryReaderDemo1: some View  {
        
        Group {
            
            // Advance Demo
            NavigationLink {
                GeometryDemo1()
                
            } label: {
                Text("Geometry demo 1")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(UIColor.customdarkGreen))
                    .cornerRadius(15)
                
            }
        }
        
    }
    
    //Geometry Demo
    var GeometryReaderDemo2: some View  {
        
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
    
    //Geometry Demo
    var GeometryReaderDemo4: some View  {
        
        Group {
           
            // Advance Demo
            NavigationLink {
                GeometryDemo4()
                  
            } label: {
                Text("Geometry demo 4")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(.orange))
                    .cornerRadius(15)
                    
            }
         
        }
        
    }
    
   
    //Geometry Demo
    var GeometryReaderDemo5: some View  {
        
        Group {
           
            // Advance Demo
            NavigationLink {
                SimpleParallaxDemo()
                  
            } label: {
                Text("Geometry Using Parallex Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(.orange))
                    .cornerRadius(15)
                    
            }
         
        }
        
    }
    
    //Geometry Demo
    var GeometryReaderDemo6: some View  {
        
        Group {
           
            // Advance Demo
            NavigationLink {
                GeometryAnimatedView()
                  
            } label: {
                Text("Geometry Animated View")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(.green))
                    .cornerRadius(15)
                    
            }
         
        }
        
    }
    
    var GeometryReaderDemo7: some View  {
        
        Group {
           
            // Advance Demo
            NavigationLink {
                GeometryParrallexEffect()
                  
            } label: {
                Text("Geometry Animated View")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(.systemPink))
                    .cornerRadius(15)
                    
            }
         
        }
        
    }
    

}

#Preview {
    GeometryReaderMain()
}
