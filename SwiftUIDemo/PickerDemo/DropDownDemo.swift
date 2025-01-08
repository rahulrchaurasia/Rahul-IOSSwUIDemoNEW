//
//  DropDownDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/05/24.
//

import SwiftUI

struct DropDownDemo: View {
    
    @StateObject private var vm = dropDownViewModel()
    
    struct Employee: Identifiable, Hashable {
        let id: UUID
        let name: String
    }
    
    @State private var selectedEmployee: Employee? = nil
    private let employees = [
        Employee(id: UUID(), name: "John Doe"),
        Employee(id: UUID(), name: "Jane Smith"),
        Employee(id: UUID(), name: "Alice Brown"),
        
        Employee(id: UUID(), name: "Rahul"),
        Employee(id: UUID(), name: "Umesh"),
        Employee(id: UUID(), name: "Tom"),
        
        Employee(id: UUID(), name: "Joy"),
        Employee(id: UUID(), name: "Niyo"),
        Employee(id: UUID(), name: "Kite")
    ]
    
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
            
            Text("Demo of DropDown")
                .font(.headline)
                .padding()
            
            Image("a2")
                .resizable()
                .scaledToFit()
                .frame(width: 50,height: 50,alignment: .leading)
            
            Text("Selected: \(selectedEmployee?.name ?? "None")")
                .padding()
            
            ReusableDropdown(
                title: "Select Employee",
                items: employees,
                nameKeyPath: \.name,
                selectedItem: $selectedEmployee
            ) { selected in
                print("Selected Employee: \(selected.name)")
            }
            .zIndex(1) // Ensure it stays on top if required
            Spacer()

        }
      
        
    
    }
}

#Preview {
    DropDownDemo()
}
