//
//  TextFieldDemo4.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 17/07/23.
//

import SwiftUI

struct TextFieldDemo4: View {
    
    @State private var name = ""
    @State private var mobNo = ""
    @State private var age = ""
    @State private var email = ""
    
    var body: some View {
        
        ScrollView {
            VStack{
                
                
                Text("For Handling Two Column at Proper Ratio")
                Divider().background(.red.opacity(0.7)).padding(.top,20)
                    .padding(.bottom)
                
                VStack(alignment: .leading,spacing: 6 ){
                    
                    HStack{
                        Image(systemName: "lightbulb.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .alignmentGuide(VerticalAlignment.center) { d in
                                d[.bottom]
                            }
                        
                        Text("Energy")
                            .font(.largeTitle)
                            .alignmentGuide(VerticalAlignment.center) { d in
                                d[.firstTextBaseline]
                            }
                    }
                    
                    HStack{
                        Text("Name :")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                            //.offset(y: 0)
                           
                        
                        TextField("Enter your name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(10)
                            .alignmentGuide(VerticalAlignment.center) { d in
                                d[.lastTextBaseline]
                            }
                           
                    }
                    
                    HStack {
                        Text("Age :")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                        TextField("Enter your age", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                            .alignmentGuide(VerticalAlignment.center) { d in
                                d[.firstTextBaseline]
                            }
                        
                    }
                    HStack {
                        Text("Mobile :")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                        TextField("Enter your MobileNo", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                            .alignmentGuide(VerticalAlignment.center) { d in
                                d[.firstTextBaseline]
                            }
                        
                    }
                    
                    HStack {
                        Text("Address :")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                        TextField("Enter your Address", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                            .alignmentGuide(VerticalAlignment.center) { d in
                                d[.firstTextBaseline]
                            }
                        
                    }
                }
            }
           
            .padding()
        }
    }
          
    
}

struct TextFieldDemo4_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo4()
    }
}
