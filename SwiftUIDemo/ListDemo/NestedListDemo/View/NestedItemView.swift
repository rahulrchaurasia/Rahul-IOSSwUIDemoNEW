//
//  NestedItemView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 31/12/23.
//

import SwiftUI
//DisclosureGroup: Creates the expanding/collapsing behavior for nested lists.
struct NestedItemView: View {
    
    @ObservedObject var vm : NestedListViewModel
    @State var item : Item
    var body: some View {
        VStack{
            DisclosureGroup(
                isExpanded: $item.isExpanded,
                content: {
                    
                    if let subItemData = item.subItem{
                        
                       
                        List(subItemData) { subitem in
                            
                            
                            Text(subitem.subtitle)
                                .font(.title3)
                                .padding()
                                .background(Color.red.opacity(0.7))
                            
                            
                        }.frame(height: 400)
                            
                    }
                        
                },
                label: {
                    
                    Button {
                       // item.isExpanded = true
                    } label: {
                        Label(item.title, systemImage: item.isExpanded ? "heart" : "heart.fill")
                            .font(.headline)
                            .padding()
                            .padding(.vertical,5)
                    }

                   
                  
                }
            )
        }
    }
}



struct NestedItemView_Previews: PreviewProvider {
    static var previews: some View {
        let vmObj = NestedListViewModel()
       //let item = Item(title: "Header1")
        
        let item = Item(title: "Header Item",isExpanded: true, subItem: [
                subItem(subtitle: "Subitem 1"),
                        subItem(subtitle: "Subitem 2")
                        ])
            NestedItemView(vm: vmObj, item: item)
    }
}
