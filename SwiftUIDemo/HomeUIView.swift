//
//  HomeUIView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 26/05/23.
//

import SwiftUI

struct HomeUIView: View {
    
    @State private var showTextFielDemo1 = false
    @State private var showTextFielDemo2 = false
    var body: some View {
        ZStack{
           
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView(showsIndicators: false){
                
                VStack {
                  
                    if(showTextFielDemo1){
                        
                        TextFieldDemo()
                    }else if(showTextFielDemo2){
                        
                        TextFieldDemo2()
                    }
                    else{
                        
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
                            TextFieldDemo()
                        } label: {
                            Text("Text demo1")
                                .padding(12)
                                .font(.title2)
                                .foregroundColor(.white)
        //                        .fontWeight(.semibold)
                                .background(.red)
                                .cornerRadius(15)
                                
                        }
                        Menu {
                            Button("Demo 1", action: placeOrder)
                             Button("Demo 2", action: adjustOrder)
                        } label: {
                            Text("TextField Demo")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
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
                       
                        
                        
                       
                    }
                    
                   Spacer()
                }.padding(.top,10)
            }
           
           
           
            
        }
    }
    
    func placeOrder() {
     
        showTextFielDemo1 = true
    }
    
    func adjustOrder() {
        
        showTextFielDemo2 = true
    }
 
}



struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
