
//
//  StickyMainView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/04/23.
//
 //********overlay Demo *****
/* overlay property alignment seperated by ","
Image(systemName: "folder")
    .font(.system(size: 55, weight: .thin))
    .overlay(Text("❤️"), alignment: .bottom)
 */

/********** *Sticky Header View********************* */

import SwiftUI
import KeychainAccess
struct StickyMainView: View {
    
    @StateObject var mainViewData = StickymainViewModel()
    
   // @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
   
    @State var keyChainData : String?
    
    var body: some View {
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let window = windowScenes?.windows.first
        
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView{
                
                //Since we are pinning Header View..
                
                LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders])  {

                    //Mark : Parallax header
//                    GeometryReader { reader -> AnyView in
//
//                        AnyView {
//                            Image("citrus")
//                                .resizable()
//                                .aspectRatio( contentMode: .fit)
//                                .frame(width: UIScreen.main.bounds.width,height:  200)
//                                .background(Color.purple.opacity(0.7))
//
//                        }!
//
//
//                    }.frame(height: 200)
                    
                   

                    Image("citrus")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width,height:  200)
                        .background(Color.purple.opacity(0.7))
                    
                    if let mydata =  keyChainData {
                        
                        Text(mydata)
                            .foregroundColor(.brown)
                            .font(.title2)
                            .padding(.horizontal,10)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Button {
                        saveAction()
                    } label: {
                        Text("Save")
                    }.frame(width: 300,height: 40)
                        .background(Color.red)
                    
                    Button("Get Data") {
                        getData()
                    }.frame(width: 300,height: 40)
                        .background(Color.green)
                    
                   //Mark: Section :---
                    Section {
     
//                        ForEach(foods) { food in
//
//                            StickyCardView(food: food)
//                        }
                        
                        //Mark : Tab with content
                        
                        ForEach(tabItems) { tab in
                            
                            VStack(alignment: .leading, spacing: 15){
                                
                                Text(tab.tabTitle)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding([.bottom,.leading])
                                
                              
                                ForEach(tab.foods){ food in
                                    
                                    StickyCardView(food: food)
                                }
                                Divider()
                                    .padding()
                                    
                               
                            }
                            
                            
                        }
                    } header: {
                     
                        StickyHeaderView(closeAction: {
                            
                           // self.dismiss()
                            presentationMode.wrappedValue.dismiss()
                        })

                    }

                }
                
               
     
            }
            
            
            .overlay(
            
                //Mark :Note: O5 Imp Here we use overlay to Use Scrollview to scroll top behind the header
                Color.red

                
                    .frame(height:window?.safeAreaInsets.top)
                
                    .ignoresSafeArea(.all,edges: .top)
                
                
                ,alignment: .top
            )
           
            .navigationBarHidden(true)          //.navigationBarBackButtonHidden(true)
            
           
          

        }
      
    }
    
  func  saveAction(){
        
      let highScore = "High score : 100 "
      let keychain = Keychain(service: "demo.KeyChain")
      keychain["HighScore"] = highScore
      print("KeyStore Data Stored")
    }
    
    func  getData(){
        
        
        let keychain  = Keychain(service: "demo.KeyChain")
        
        keyChainData = keychain["HighScore"] ?? "No Data"
        
        print("KeyStore Data",keychain["HighScore"] ?? "No Data")
        
        
        
    }
           
        
    
   
}

struct StickyMainView_Previews: PreviewProvider {
    static var previews: some View {
        StickyMainView( keyChainData: "")
    }
}
