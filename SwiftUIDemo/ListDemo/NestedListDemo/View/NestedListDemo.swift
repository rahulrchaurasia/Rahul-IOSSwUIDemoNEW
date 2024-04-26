//
//  NestedListDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 31/12/23.
//
/*****************************************/
//DisclosureGroup: Creates the expanding/collapsing //behavior for nested lists.
/*****************************************/
import SwiftUI

struct NestedListDemo: View {
    
   @StateObject var vm = NestedListViewModel()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
  
    var body: some View {
       
   
        VStack(alignment: .leading, spacing: 15){
            
            HStack{
                Text("Disclosure")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                    .padding([.top,.horizontal])
                Spacer()
                
                   
                Button(action: {
                    
                    handleDismissAll()
                    
                }, label: {
                   Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22,height: 22)
                        .padding(.trailing,10)
                    
                })
            }
                
            List(vm.items){ item in
                
               // NestedItemView(vm: vm, item: item)
                DisclosureGroup(
                    content: {
                        
                        if let subitemData = item.subItem {
                            
                            VStack(spacing:0){
                                ForEach(subitemData){ subItem in
                                    
                                    NestedRowItem(subData: subItem)
                                       
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                                   .padding()
                                   // Apply background here:
                                   .background(Color.mint)
                                   .cornerRadius(10)
                          
                          
                        }
                        
                    },
                    label: {
                        VStack{
                            Text(item.title)
                                .font(.customfont(.bold, fontSize: 20))
                        }
                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
                        .padding()
                        
            
                           
                    }
                    
                )
               
                
           
                
                  
            }
            .listRowInsets(EdgeInsets()) // Remove default padding
            .listStyle(.plain)
            .background(Color.mint)
            
            
        }
        .overlay(alignment: .top) {
           
            Color.primaryApp
                .frame(height: .topInsets)
                .ignoresSafeArea(.all,edges: .top)
        }
       
      
    }
}

private extension NestedListDemo {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
}
//

struct NestedListDemo_Previews: PreviewProvider {
    static var previews: some View {
        NestedListDemo()
    }
}
