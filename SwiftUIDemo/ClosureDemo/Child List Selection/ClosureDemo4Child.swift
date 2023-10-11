//
//  ClosureDemo4Child.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import SwiftUI

struct ClosureDemo4Child: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedItem :  String
    
    var callback : (String) -> Void
    @State private var items = ["Item 1", "Item 2", "Item 3","Item 4","Item 5","Item 6",
         "Item 7","Item 8","Item 9","Item 10"]
    
      @State private var selectedRow: Int? = nil
   // @State private var selection: String?
    
    var body: some View {
        VStack{
            
            Text("Child View")
                .font(.title)
          
            VStack{
                List(selection: $selectedRow ){
                   
                    ForEach(0..<items.count, id: \.self) { index in
                       
                        
                        Text(items[index])
                            .tag(index)
                    }
                }.listStyle(.plain)
                    
                Button(action: {
                                if let selectedIndex = selectedRow {
                                    let selectedItem = items[selectedIndex]
                                    self.selectedItem = selectedItem

                                    // Call the callback closure to send data to the parent view
                                    self.callback(selectedItem)
                                    
                                    self.dismiss()
                                }
                            }) {
                                Text("Select Item")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                
                Spacer()
            }
           
           
          
        }.frame(maxHeight: .infinity)
    }
}

struct ClosureDemo4Child_Previews: PreviewProvider {
    static var previews: some View {
        ClosureDemo4Child(selectedItem: .constant("Item 1")){ _ in }
    }
}
