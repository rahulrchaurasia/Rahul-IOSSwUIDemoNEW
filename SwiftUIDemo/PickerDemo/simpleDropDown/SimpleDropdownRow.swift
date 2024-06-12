//
//  SimpleDropdownRow.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/05/24.
//

import SwiftUI

struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct SimpleDropdownRow: View {
        var option: DropdownOption
        var onOptionSelected: ((_ option: DropdownOption) -> Void)?

        var body: some View {
            Button(action: {
                if let onOptionSelected = self.onOptionSelected {
                    onOptionSelected(self.option)
                }
            }) {
                HStack {
                    Text(self.option.value)
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
        }
}

struct SimpleDropdownRow_Previews: PreviewProvider {
    static var previews: some View {
        let options = DropdownOption(key: "1", value: "Sunday")

      return  SimpleDropdownRow(
            option: DropdownOption(key: "2", value: "Option 1"),
                    onOptionSelected: { _ in }
                )
        .frame(width: .infinity, height: 40) 
        
        
    }
}
