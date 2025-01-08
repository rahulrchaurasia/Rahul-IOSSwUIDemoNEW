//
//  ReusableDropdown.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 11/12/24.
//

import Foundation
import SwiftUICore
import UIKit
import SwiftUI



struct ReusableDropdown2<T: Identifiable & Hashable>: View {
    let title: String
    let items: [T]
    let nameKeyPath: KeyPath<T, String>
    
    @Binding var selectedItem: T?
    @State private var isExpanded = false
    
    var height: CGFloat = 200
    var onSelect: ((T) -> Void)?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                // Dropdown Header
                HStack {
                    Text(selectedItem?[keyPath: nameKeyPath] ?? title)
                        .foregroundColor(selectedItem == nil ? Color.secondary : Color.primary)
                        .accessibility(label: Text(selectedItem?[keyPath: nameKeyPath] ?? title))
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                .onTapGesture {
                    withAnimation(.spring()) {
                        isExpanded.toggle()
                    }
                }
            }
            
            // Dropdown Content (appears below without pushing header up)
            if isExpanded {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            if items.isEmpty {
                                ProgressView("Loading...")
                                    .padding()
                            } else {
                                ForEach(items, id: \.self) { item in
                                    VStack(alignment: .leading) {
                                        Text(item[keyPath: nameKeyPath])
                                            .foregroundColor(.primary)
                                            .padding(.horizontal)
                                            .padding(.vertical, 8)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(selectedItem?.id == item.id ? Color.blue.opacity(0.1) : Color.clear)
                                            .onTapGesture {
                                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                                selectedItem = item
                                                isExpanded = false
                                                onSelect?(item)
                                            }
                                        
                                        if item.id != items.last?.id {
                                            Divider()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxHeight: height)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .padding(.top, 50) // Ensures dropdown content starts below header
            }
        }
        .animation(.spring(), value: isExpanded)
    }
}

struct ReusableDropdown1<T: Identifiable & Hashable>: View {
    let title: String
    let items: [T]
    let nameKeyPath: KeyPath<T, String>
    
    @Binding var selectedItem: T?
    @State private var isExpanded = false
    
    var height: CGFloat = 200
    var onSelect: ((T) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(selectedItem?[keyPath: nameKeyPath] ?? title)
                    .foregroundColor(selectedItem == nil ? Color.secondary : Color.primary)
                    .accessibility(label: Text(selectedItem?[keyPath: nameKeyPath] ?? title))
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        if items.isEmpty {
                            ProgressView("Loading...")
                                .padding()
                        } else {
                            ForEach(items, id: \.self) { item in
                                VStack(alignment: .leading) {
                                    Text(item[keyPath: nameKeyPath])
                                        .foregroundColor(.primary)
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(selectedItem?.id == item.id ? Color.blue.opacity(0.1) : Color.clear)
                                        .onTapGesture {
                                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                            selectedItem = item
                                            isExpanded = false
                                            onSelect?(item)
                                        }
                                    
                                    if item.id != items.last?.id {
                                        Divider()
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: height)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
        .animation(.spring(), value: isExpanded)
    }
}

struct ReusableDropdownPreview: View {
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
        VStack {
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
        }
        .padding()
    }
}

struct ReusableDropdownPreview_Previews: PreviewProvider {
    static var previews: some View {
        ReusableDropdownPreview()
    }
}



struct ReusableDropdown<T: Identifiable & Hashable>: View {
    let title: String
    let items: [T]
    let nameKeyPath: KeyPath<T, String>
    
    @Binding var selectedItem: T?
    @State private var isExpanded = false
    
    var height: CGFloat = 200
    var onSelect: ((T) -> Void)?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Dropdown Trigger
            HStack {
                Text(selectedItem?[keyPath: nameKeyPath] ?? title)
                    .foregroundColor(selectedItem == nil ? Color.secondary : Color.primary)
                    .accessibility(label: Text(selectedItem?[keyPath: nameKeyPath] ?? title))
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }
            
            // Dropdown Content
            if isExpanded {
                dropdownContent
                    .offset(y: 50) // Positions content below the trigger
                    .zIndex(1) // Ensures content appears above other views
            }
        }
        .frame(maxWidth: .infinity) // Ensures full width
        .animation(.spring(), value: isExpanded)
    }
    
    private var dropdownContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if items.isEmpty {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    ForEach(items, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text(item[keyPath: nameKeyPath])
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(selectedItem?.id == item.id ? Color.blue.opacity(0.1) : Color.clear)
                            .contentShape(Rectangle()) // Makes the entire row tappable
                            .onTapGesture {
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                selectedItem = item
                                isExpanded = false
                                onSelect?(item)
                            }

                            if item.id != items.last?.id {
                                Divider()
                            }
                        }

                    }
                }
            }
        }
        .frame(maxHeight: height)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

