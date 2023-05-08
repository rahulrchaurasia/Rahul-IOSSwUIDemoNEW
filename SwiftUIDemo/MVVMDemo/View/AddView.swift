//
//  AddView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/03/23.
//

/*************@Environment(\.presentationMode)******************/
/*
  Note : For closing current view use @Environment(\.presentationMode)
 
   presentationMode.wrappedValue.dismiss()  : close the current view
 */
//*************************************************************************** 

import SwiftUI

struct AddView: View {  
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var txtSearch : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    let bgsurface = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.6446088576)
    var body: some View {
        ScrollView{
            VStack {
                 TextField("Type Something Here..", text: $txtSearch)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button {
                    saveButtonClick()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.accentColor
                        )
                        .cornerRadius(10)
                }

            }.padding(14)
            
           
                         
                            
                            
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
       
    }
    
    func saveButtonClick(){
         
        if(isValidTextSearch()){
            
            print("Add item")
            listViewModel.addItem(title: txtSearch)
            presentationMode.wrappedValue.dismiss()
            
        }
      
       
    }
    
    func isValidTextSearch() -> Bool{
        
        if(txtSearch.count > 3){
            return true
        }else{
            alertTitle = Constant.minStringReqMSG
            showAlert.toggle()
            return false
        }
        
    }
    
    func getAlert() -> Alert {
        
        return Alert(title: Text(alertTitle)
                     
//                      ,
//                     primaryButton: .destructive(Text("Delete")) {
//                    print("Deleting...")
//         },
//                     secondaryButton: .cancel()
        )
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
       
    }
}
