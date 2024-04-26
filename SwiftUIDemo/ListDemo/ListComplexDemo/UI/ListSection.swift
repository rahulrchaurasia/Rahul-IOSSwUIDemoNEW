//
//  ListSection.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 19/07/23.
//

import SwiftUI

struct ListSection: View {
    
//    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
//    
    @Environment(\.dismiss) var dismiss

    init(){
         Theme.navigationBarColors(background: .purple, titleColor: .white)
      }
    var body: some View {
        
        ZStack{
            VStack{
                HeaderView
                   
                    .overlay(alignment: .topLeading) {
                      
                        Button {
                           dismiss()
                        } label: {
                           Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            
                                .padding(.leading,10)
                                .padding(.top, 10)
                        }
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
                    .background(Color("skyblue"))
                  
                
                Divider()
                
                
                ListViewData
            }
            .padding(.top, .topInsets)
            .padding(.bottom,.bottomInsets)
           
            
           
        }
     
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

extension ListSection {
    
    var HeaderView: some View {
        
        HStack( spacing: 15) {
         
            Image("u1")
                .resizable()
               
                .frame(width: 60.0, height: 60.0)
                .cornerRadius(30)
            
            VStack{
                
                HStack{
                    
                    Text("Order Summary")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                    Image(systemName: "pencil")
                        .foregroundStyle(Color(.black))
                    
                    Spacer()
                }
                
                Text("codeforany@gmail.com")
                    .font(.system(size: 16,weight: .thin))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
                    .tint(.gray40)
            }
               
        }.padding(.horizontal,20)
            .padding(.leading,20)
        
    }
}

extension ListSection {
    
    var ListViewData: some View {
        
        List {
            
            
            // refer this One Section
            Section {
             
                ForEach(1...10,id: \.self ) { count in
                    Text("Row  Initial \(count)")
                }
            } header: {
                Text("Header Startup ")
            }

            
            Section(header: Text("Header")) {
                Text("Row 1")
                Text("Row 2")
                Text("Row 3")
            }
            
            
            Section(header: Text("Another Header 2")) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
            Section(header: Text("Another Header 3")) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
            Section(header: Text("Another Header 4")) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
            Section(footer:  Text("Another Header 5").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)) {
                Text("Row 4")
                Text("Row 5")
                Text("Row 6")
            }
        }
    }
}
struct ListSection_Previews: PreviewProvider {
    static var previews: some View {
        ListSection()
    }
}


