//
//  DropDownDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/05/24.
//

import SwiftUI

struct DropDownDemo: View {
    
    @StateObject private var vm = dropDownViewModel()
    
    var body: some View {
        
        VStack{
            
            Text("Drop Down Example")
                .padding(.top,40)
            
            
            Menu {
               
                ForEach(vm.zoneArr){ obj in
                    
                    Button {
                        print("done")
                        vm.selectZone = obj
                    } label: {
                        Text(obj.name)
                            
                            .padding()
                        
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            } label: {
               
                HStack{
                    
                    Text(vm.selectZone?.name ?? "Select Zone")
                        .font(.customfont(.extraBold, fontSize: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("▼")
                        .font(.customfont(.extraBold, fontSize: 17))
                }
            }

        }
      
        
    
    }
}

#Preview {
    DropDownDemo()
}
