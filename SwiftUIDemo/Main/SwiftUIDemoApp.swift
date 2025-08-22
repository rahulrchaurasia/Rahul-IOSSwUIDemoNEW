//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 25/02/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    
    // Create the NetworkMonitor as a StateObject
        @StateObject private var networkMonitor = NetworkMonitor()

   @StateObject   var listViewModel: ListViewModel = ListViewModel()
    
      
    @StateObject var homeData = HomeViewModel()
    @StateObject var router = Router(initial: AppRoute.Dashboard)
    
    
    //Mark : AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //Mark : Download Manger
    @StateObject private var downloadManager = DownloadManager.shared
      
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
            .environmentObject(homeData)
            .environmentObject(networkMonitor) // Inject it here
            
            /*************************environmentObject**********************************/
            // Note : environmentObject hold all the data which it get
            // and carry till NavigationView hirearchy exist.
            
            /* Yo Use : refer ListView
            @EnvironmentObject var listViewModel : ListViewModel
             get all the ListViewModel data
            /**************************************************************************/ */
             
            .environmentObject(downloadManager)

           // .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
            
            .onAppear{
                
                // Call the first function for notification permissions
                self.requestNotificationPermission()
                
                // Call the second function for the tap gesture
                UIApplication.shared.addTapGestureRecognizer()
            }
            
        }
    }
    
    
    func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if granted {
                    print("Notification permission granted.")
                } else if let error = error {
                    print("❌ Notification permission error: \(error.localizedDescription)")
                }
            }
        }
}

struct Previews_SwiftUIDemoApp_Previews: PreviewProvider {
    static var previews: some View {
       // /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
      //  ContactsDetailView()
        
        var networkMonitor =  NetworkMonitor()
        @StateObject  var downloadManager = DownloadManager.shared
          
        HomeUIView()
            .environmentObject(networkMonitor)
            .environmentObject(downloadManager)
       
    }
}
