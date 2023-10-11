//
//  ClosureDemo4.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI
//
/*
 Get Data from Child List
 */
//
struct ClosureDemo4: View {
    
    @State private var selectedItem: String = ""
    @State private var shouldShowListData: Bool = false
    var body: some View {
        VStack{
            
            Text("Parent View")
                .font(.title)
            
            
            Button {
                shouldShowListData.toggle()
            } label: {
                
               Text("Select List")
                    .padding()
                    .padding(.horizontal,30)
                
                    .background(Color.yellow.opacity(0.6))
                    .cornerRadius(15)
                
            }
            
            Text(selectedItem)
                .font(.title3)
                .foregroundColor(.brown.opacity(0.8))

           
        }
        .sheet(isPresented: $shouldShowListData) {
            ClosureDemo4Child(selectedItem: $selectedItem) { childData in
                // Closure callback from ChildView
                selectedItem = childData
            }
        }
    }
}

struct ClosureDemo4_Previews: PreviewProvider {
    static var previews: some View {
        ClosureDemo4()
    }
}
