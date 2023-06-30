//
//  SubScriberMainDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/06/23.
//

import SwiftUI

struct SubScriberMainDemo: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            
            VStack {
              
                
        

                NavigationLink {
                    SubscriberDemo()
                } label: {
                    Text("Publisher & SubScribers 1")
                        .padding(12)
                        .font(.title2)
                        .font(.system(.subheadline))
                        .foregroundColor(.white)

                        .background(.purple).opacity(0.9)
                        .cornerRadius(15)
                        
                }
                
                
                NavigationLink {
                    //SubscriberDemo()
                    SubScriberDemo1()
                } label: {
                    Text("Publisher & SubScribers 2")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
                        .background(.red)
                        .cornerRadius(15)
                        
                }
                
               Spacer()
            }.padding(.top,10)
        }
    }
}

struct SubScriberMainDemo_Previews: PreviewProvider {
    static var previews: some View {
        SubScriberMainDemo()
    }
}
