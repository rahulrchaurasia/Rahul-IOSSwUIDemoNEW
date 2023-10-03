//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/02/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    
   @StateObject   var listViewModel: ListViewModel = ListViewModel()
    
    @StateObject var router = Router(initial: AppRoute.Dashboard)
      
    var body: some Scene {
        WindowGroup {
          
  
            NavigationView {
                HomeUIView()
               // or add directly in Home Root View
//                    .navigationTitle("Home")
//                    .toolbar {
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button {
//                                print("Done")
//                            } label: {
//                                Image(systemName: "plus")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 20)
//                            }
//                        }
//                    }
                
            }
            .tint(.orange)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            
            .environmentObject(listViewModel)
            
            /*************************environmentObject**********************************/
            // Note : environmentObject hold all the data which it get
            // and carry till NavigationView hirearchy exist.
            
            /* Yo Use : refer ListView
            @EnvironmentObject var listViewModel : ListViewModel
             get all the ListViewModel data
            /**************************************************************************/ */
             
            .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}

struct Previews_SwiftUIDemoApp_Previews: PreviewProvider {
    static var previews: some View {
       // /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        ContactsDetailView()
    }
}
