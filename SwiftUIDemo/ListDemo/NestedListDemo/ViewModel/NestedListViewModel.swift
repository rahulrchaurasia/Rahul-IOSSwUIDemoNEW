//
//  NestedListViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 31/12/23.
//

import Foundation

class NestedListViewModel : ObservableObject {
    
   @Published var items : [Item] = [
        
        Item( title: "Section 1" ,isExpanded: true, subItem:
        [ subItem(subtitle: "Item 1.1"),
          subItem(subtitle: "Item 1.2"),
          subItem(subtitle: "Item 1.3")
        ]),
        
        Item( title: "Section 2", subItem:
        [ subItem(subtitle: "Item 2.1"),
          subItem(subtitle: "Item 2.2"),
          subItem(subtitle: "Item 2.3")
        ]),
        
        Item( title: "Section 3",isExpanded: true, subItem:
        [ subItem(subtitle: "Item 3.1"),
          subItem(subtitle: "Item 3.2"),
          subItem(subtitle: "Item 3.3")
        ]),
        
        Item( title: "Section 4", subItem:
        [ subItem(subtitle: "Item 4.1"),
          subItem(subtitle: "Item 4.2"),
          subItem(subtitle: "Item 4.3")
        ]),
        
        Item( title: "Section 5", subItem:
        [ subItem(subtitle: "Item 5.1"),
          subItem(subtitle: "Item 5.2"),
          subItem(subtitle: "Item 5.3")
        ])
    
    ]
}
