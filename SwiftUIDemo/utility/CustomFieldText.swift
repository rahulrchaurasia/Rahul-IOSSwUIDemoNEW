//
//  CustomFieldText.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 26/05/23.
//

import SwiftUI

struct CustomFieldText: View {
    @Binding var name: String
    var label: String
    var required: Bool = true
    var indicator: Bool = false
    @State private var onKeyIn = false

var body: some View {
    ZStack {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                if required {
                    Text("*")
                }
                Spacer()
            }
            .multilineTextAlignment(.leading)
            .font(.custom("ZonaPro-SemiBold", size: self.onKeyIn || self.name != "" ? 14 : 18))
            .foregroundColor(.blue)
            .offset(y: self.onKeyIn || self.name != "" ? -30 : 0)
            //            .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0))
            .onChange(of: onKeyIn) { _ in
                withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0)) {
                    // Animation block
                }
            }
            
            Rectangle().frame(height: 3)
                .cornerRadius(10)
                .foregroundColor(Color(#colorLiteral(red: 0.8392156863, green: 0.8784313725, blue: 0.8784313725, alpha: 1)))
        }
        VStack {
            //TextField(self.name, text: self.$name)
            TextField("", text: self.$name, onEditingChanged: { editing in
                withAnimation {
                    self.onKeyIn = editing || !self.name.isEmpty
                }
            })
            
            .font(.custom("ZonaPro-SemiBold", size: 18))
            .autocapitalization(.none)
            .textContentType(.nickname)
            .foregroundColor(.black)
            .padding(.bottom, 15)
            .padding(.top, 5)
            .onTapGesture {
                self.onKeyIn = true
            }
            .zIndex(1)
        }
        
        
        if indicator && !self.name.isEmpty {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Verifying")
                        .font(.custom("ZonaPro-Light", size: 10))
                        .foregroundColor(Color.white)
                }
            }
        }
        
    }
}}

struct CustomFieldText_Previews: PreviewProvider {
  
    static var previews: some View {
        CustomFieldText(name: .constant("John"), label: "Enter Name")
    }
}
