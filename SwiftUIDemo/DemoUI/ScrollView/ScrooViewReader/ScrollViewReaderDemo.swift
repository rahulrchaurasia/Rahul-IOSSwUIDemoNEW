//
//  ScrollViewReaderDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 04/08/23.
//

import SwiftUI

struct ScrollViewReaderDemo: View {
    var body: some View {
        
        
        ScrollViewReader { proxy in
            VStack{
                
                Text("")
                Button {
                    print("cdcd")
                    
                    proxy.scrollTo(100,anchor: .top)
                    
                } label: {
                    Text("Scroll to 100")
                        .padding()
                        .padding(.horizontal)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.7))
                        .cornerRadius(20)
                    
                    
                }
                
                List(1...500, id: \.self){ index in
                    
                    Text("\(index)")
                        .font(.title2)
                        .padding(.horizontal)
                    
                        .listRowSeparator(.hidden)
                    
                        .id(index)
                    
                }
                .listStyle(.plain)
                .toolbar{
                    EditButton()
                }
                
            }.background(Color.gray.opacity(0.2))
            
            
        }.navigationTitle("Scroll View Reader")
          
        
    }
}

struct ScrollViewReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderDemo()
    }
}
