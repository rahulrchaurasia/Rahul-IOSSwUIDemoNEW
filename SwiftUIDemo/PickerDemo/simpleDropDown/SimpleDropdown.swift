//
//  SimpleDropdown.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/05/24.
//

import SwiftUI

struct SimpleDropdown: View {
    
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.options, id: \.self) { option in
                        SimpleDropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                    }
                }
            }
            .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
            .padding(.vertical, 5)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
}



struct SimpleDropdown_Previews: PreviewProvider {
    static var previews: some View {
       // let options = DropdownOption(key: "1", value: "Sunday")
        
            var options: [DropdownOption] = [
                    DropdownOption(key: "1", value: "Sunday"),
                    DropdownOption(key: "2", value: "Monday"),
                    DropdownOption(key: "3", value: "Tuesday"),
                    DropdownOption(key: "4", value: "Wednesday"),
                    DropdownOption(key: "5", value: "Thursday"),
                    DropdownOption(key: "6", value: "Friday"),
                    DropdownOption(key: "7", value: "Saturday")
                ]
        SimpleDropdown(options: options)
    }
}
