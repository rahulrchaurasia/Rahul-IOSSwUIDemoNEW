//
//  SupportUserView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/05/24.
//

import SwiftUI



struct SupportUserView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var sVM = SupportViewModel.shared
    
    @State var txtMessage = ""
    
    var body: some View {
        ZStack{
            
            VStack( spacing: 0 ,content: {
                
                ZStack{
                    
                    HStack{
                        Button(action: {
                            mode.wrappedValue.dismiss()
                        }, label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        })
                        
                        Spacer()
                       
                    }
                    
                    Text("Supports")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(maxWidth: .infinity, alignment : .center)
                }
                
                .padding(.bottom , 8)
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                Rectangle()
                    .fill(Color.lightText)
                    .frame(height: 2)
                
                ScrollView {
                    
                    LazyVStack( content: {
                        ForEach($sVM.userArr, id: \.id) { user in
                            
                           
                            
                            Button(action: {
                               // sVM.selectSupportUser = uObj
                            }, label: {
                                ExtractedView()
                            })
                            
                            
                        }
                    })
                    .padding()
                    .padding(.bottom , .bottomInsets)
                    
                    
                }
                .background( Color.lightWhite )
            })
        }
        .onAppear(){
            //sVM.supportUserApi()
        }
        .background( NavigationLink(destination: CamGalleryUIDemo(), isActive: $sVM.showMessage , label: {
            EmptyView()
        }))
        .alert(isPresented: $sVM.showError, content: {
            
            Alert(title: Text("Driver App"), message: Text(sVM.errorMessage), dismissButton: .default(Text("OK")) {
                
            } )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SupportUserView()
}


struct ExtractedView: View {
    var body: some View {
        HStack {
            
            Image("u1")
                .resizable()
                .scaledToFill()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
                .clipped()
            
            VStack( spacing: 0) {
                
                HStack {
                    Text(user.name)
                        .font(.customfont(.bold, fontSize: 17))
                        .foregroundColor(.primaryText )
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    Text(user.id.string)
                        .font(.customfont(.regular, fontSize: 13))
                        .foregroundColor(.secondaryText)
                    
                }
                
                HStack {
                    Text(user.message)
                        .font(.customfont(.regular, fontSize: 15))
                        .foregroundColor(.secondaryText )
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    if( user.baseCount > 0 ) {
                        Text( "\( user.baseCount )" )
                            .font(.customfont(.semiBold, fontSize: 11))
                            .foregroundColor(.white)
                            .frame(minWidth: 15)
                            .padding(4)
                            .background( Color.primaryApp)
                            .cornerRadius(20)
                    }
                    
                    
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding()
        .background(Color.white)
        
        .cornerRadius(10)
    }
}
