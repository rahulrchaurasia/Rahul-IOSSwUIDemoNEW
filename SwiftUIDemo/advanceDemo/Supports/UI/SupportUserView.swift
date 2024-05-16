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
                            
                            //sVM.showMessage = true
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
                        ForEach(sVM.userArr, id: \.id) { user in
                        
                            
                            Button(action: {
                               // sVM.selectSupportUser = uObj
                                sVM.showError = true
                                
                                sVM.errorMessage = "Show Data"
                                
                            }, label: {
                                SupportProfile(user: user)
                            })
                            
                            
                        }
                    })
                    .padding()
                    .padding(.bottom , .bottomInsets)
                    
                    
                }
                .background( Color.lightWhite )
                
                .alert(isPresented: $sVM.showError, content: {
                    
                    Alert(title: Text("Driver App"), message: Text(sVM.errorMessage), dismissButton: .default(Text("OK")) {
                        
                    } )
                })
            })
        }
        .onAppear(){
            //sVM.supportUserApi()
            sVM.addUser()
        }
        .background( NavigationLink(destination: CamGalleryUIDemo(), isActive: $sVM.showMessage , label: {
            EmptyView()
        }))
        
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

//#Preview {
//    SupportUserView()
//}



struct SupportUserView_Previews: PreviewProvider {
    static var previews: some View {

        let user = UserProfile(id: 1, name: "Rahul",message: "Android Developer",baseCount: "34000Rs", createdDate: "2-Jan-2021")
        SupportUserView()
    }
}
