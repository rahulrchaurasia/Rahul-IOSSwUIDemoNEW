//
//  GeometryDemo3.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 22/12/23.
//
/**************************************/
//Handling Safe Area
import SwiftUI

struct GeometryDemo3: View {
    var body: some View {
        GeometryReader { reader in
         
            VStack {
                            
                                Color.blue
                                    .frame(height: reader.size.height * (1/5)) // 2
                                    .cornerRadius(10)
                                    .padding()
                            
                                Color.green
                                    .frame(height: reader.size.height * (1/2)) // 3
                                    .cornerRadius(10)
                                    .padding()
                        
                        }
        }
    }
}

#Preview {
    GeometryDemo3()
}
