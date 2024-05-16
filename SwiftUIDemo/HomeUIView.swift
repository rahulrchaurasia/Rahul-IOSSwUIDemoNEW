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
                    
                    PickerDemo
                    
                    TextFieldDemo
                    
                    ListDemoMenu
                  
                    LoaderDemo
                    
                    TabViewDemo
                    
                    SheetDemoView
                    
                    ViewBuilderDemo
                    
                   
                    
                    SubScriberMainDemo
                    
                 
                    
                    GCDDemo
                    
                    PullToRefreshDemo
                    
                    
                  
//                     stickyHeaderUIView
//
                }.padding(.top,10)
            }
           
           
           
            
        }
        .safeAreaInset(edge: .bottom,alignment: .trailing, spacing: 200){
            
            plusBtn
                .padding(.trailing)

        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    print("Done")
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
            }
        }
        
    }
    
    func getOrder(baseURL : URL) -> Bool{
        
        guard let url = URL(string: EndPoints.allorders.path, relativeTo: baseURL )
        else{
            print("Error");
            return true
            
        }
        
        print("URL \(url)")
        
        return true
        
    }
 
}

extension HomeUIView {
    
    //PickerDemo
    var PickerDemo: some View  {
        
        Group {
            
            if #available(iOS 16.0, *) {
                NavigationStack{
                    
                        NavigationLink(value: 1) {
                            Text("Nav Stack demo")
                                .padding(12)
                                .font(.title2)
                                .foregroundColor(.white)
                                .background(Color(UIColor.customdarkGreen))
                                .cornerRadius(15)
                        }
                    
                }
            }
            
            
        
           
            // Advance Demo
    
            NavigationLink {
                AdvanceDemoView()
                  
            } label: {
                Text("Advance demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color(UIColor.customdarkGreen))
                    .cornerRadius(15)
                    
            }
            // Advance Demo2
            NavigationLink {
                AdvanceDemo2View()
                  
            } label: {
                Text("Advance demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                
                    .background(Color(UIColor.blue).opacity(0.7))
                    .cornerRadius(15)
                    
            }
           // ClosureDemoMain
            NavigationLink {
                ClosureDemoMain()
                  
            } label: {
                Text("Closure demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.yellow)
                
                    .cornerRadius(15)
                    
            }
            NavigationLink {
                PickerDEmo()
                  
            } label: {
                Text("Picker demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
            }
            
            NavigationLink {
                PickerDEmo()
                  
            } label: {
                Text("Picker demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
                    
            }
            
            NavigationLink {
                //MainTabbedView()
              //  MainPageNavDrawerHome()
                SlideMenuCustom1()
                  
            } label: {
                Text("Navigation Drawer demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.primary.opacity(0.7))
                    .cornerRadius(15)
                    
            }
        }
        
    }
    
    //ListDemo
    var ListDemoMenu: some View  {
        
        Group {
           
            NavigationLink {
                SwiftUIDemo.ListDemoMenu()
                  
            } label: {
                Text("List demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
            }
        }
        
    }
    
    

    var TextFieldDemo : some View {
        
        Group{
            
    
            NavigationLink {
                TextFieldMain()
                    .navigationTitle("Text Demo")
            } label: {
                Text("Text demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                
            }
            NavigationLink {
                TextFieldDemo2()
                    .navigationTitle("TextField Style")
                
//                    .navigationBarBackButtonHidden(true)
//                    .navigationTitle("TTT")
                    .navigationBarTitleDisplayMode(.large)
            } label: {
                Text("TextField Style")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.brown)
                    .cornerRadius(15)
                
            }
            
            //TextFieldDemo2()
           
        }
        
    }
    
    
    //LoaderDemo
    var LoaderDemo : some View {
        
        Group{
            
            NavigationLink {
                LoaderDemoView()
                
            } label: {
                Text("Loader Demo")
                    .padding(12)
                    .font(.title2)
                    .font(.system(.subheadline))
                    .foregroundColor(.white)
                
                    .background(Color.purple)
                    .cornerRadius(15)
                
            }
        }
        
    }
    
    //ViewBuilderDemo
    var ViewBuilderDemo : some View {
        
        Group{
            
            NavigationLink {
            
                
                ViewBuilderDemo2()
                    .navigationTitle("View Builder Demo")
            } label: {
                Text("ViewBuilder Demo")
                    .padding(12)
                    .font(.title2)
                    .font(.system(.subheadline))
                    .foregroundColor(.white)
                
                    .background(.purple).opacity(0.9)
                    .cornerRadius(15)
                
            }
        }
        
    }
    
   
                  

        

}

extension HomeUIView {
  
    //TabViewDemo
    var TabViewDemo : some View {
        
        Group {
            
            NavigationLink {
                SwiftUIDemo.TabViewMain()
            } label: {
                Text("TabView Demo")
                    .padding(12)
                    .font(.title2)
                    .font(.system(.subheadline))
                    .foregroundColor(.white)
                
                    .background(Color.yellow)
                    .cornerRadius(15)
                
                
            }
        }
    }

    
    var SheetDemoView : some View {
       
        Group{
            NavigationLink {
               // SwiftUIDemo.SheetDemoView()
                
                SheetDemo()
            } label: {
                Text("Sheets Demo")
                    .padding(12)
                    .font(.title2)
                    .font(.system(.subheadline))
                    .foregroundColor(.white)
                
                    .background(Color.skyblue)
                    .cornerRadius(15)
                
            }
        }
    }
                    

    var stickyHeaderUIView : some View {
        
        Group{
            
            NavigationLink {
                SwiftUIDemo.stickyHeaderUIView()
                    .navigationTitle("First View")
            } label: {
                Text("List Basic & Advance Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                //                        .fontWeight(.semibold)
                    .background(.red)
                    .cornerRadius(15)
                
            }
            
        }
        
    }

    
    var SubScriberMainDemo : some View {
        
        Group{
            NavigationLink {
                SwiftUIDemo.SubScriberMainDemo()
                
            } label: {
                Text("Publisher & SubScribers")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                //                        .fontWeight(.semibold)
                    .background(.red)
                    .cornerRadius(15)
                
            }
        }
    }
    
    var GCDDemo: some View {
        
        Group{
            NavigationLink {
                SwiftUIDemo.GCDDemo()
                    .navigationTitle("GCD Demo")
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
    }
    
    var plusBtn: some View {
        
        Group{
            NavigationLink {
                SwiftUIDemo.GCDDemo()
                    .navigationTitle("GCD Demo")
            } label: {
                
                Image(systemName: "plus")
                    .symbolVariant(.circle.fill)
        
                    .foregroundColor(.blue)
                    .font(.system(size: 44,
                                  weight: .bold,
                                  design: .rounded))
                
            }
        }
    }
    
    var PullToRefreshDemo: some View {
        
        Group{
            NavigationLink {
                SwiftUIDemo.PullToRefreshDemo()
                
            } label: {
                Text("Pull To Refresh Demo")
                    .padding(12)
                    .font(.title2)
                    .font(.system(.subheadline))
                    .foregroundColor(.white)
                
                    .background(Color.yellow).opacity(0.9)
                    .cornerRadius(15)
                
            }
        }
    }
    
    

}


struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
