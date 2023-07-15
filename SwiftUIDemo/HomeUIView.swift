//
//  HomeUIView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 26/05/23.
//

import SwiftUI

struct HomeUIView: View {
    
    
    var body: some View {
        ZStack{
           
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView(showsIndicators: false){
                
                VStack {
                  
                
                        NavigationLink {
                            stickyHeaderUIView()
                        } label: {
                            Text("List Basic & Advance Demo")
                                .padding(12)
                                .font(.title2)
                                .foregroundColor(.white)
        //                        .fontWeight(.semibold)
                                .background(.red)
                                .cornerRadius(15)
                                
                        }

            
                        NavigationLink {
                            TextFieldMain()
                        } label: {
                            Text("Text demo")
                                .padding(12)
                                .font(.title2)
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(15)
                                
                        }
                        
                    
                        


                        NavigationLink {
                            ViewBuilderDemo()
                        } label: {
                            Text("ViewBuilder Demo")
                                .padding(12)
                                .font(.title2)
                                .font(.system(.subheadline))
                                .foregroundColor(.white)

                                .background(.purple).opacity(0.9)
                                .cornerRadius(15)
                                
                        }
                        
                        
                        NavigationLink {
                            SubScriberMainDemo()
                            
                        } label: {
                            Text("Publisher & SubScribers")
                                .padding(12)
                                .font(.title2)
                                .foregroundColor(.white)
        //                        .fontWeight(.semibold)
                                .background(.red)
                                .cornerRadius(15)
                                
                        }
           
                        NavigationLink {
                            GCDDemo()
                        } label: {
                            Text("GCD Demo")
                                .padding(12)
                                .font(.title2)
                                .font(.system(.subheadline))
                                .foregroundColor(.white)

                                .background(CustomColor.skyblue).opacity(0.9)
                                .cornerRadius(15)
                                
                        }
                       
                        
                        
                       
                    
                    
                   Spacer()
                }.padding(.top,10)
            }
           
           
           
            
        }
    }
    
    
 
}



struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
