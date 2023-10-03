//
//  SheetDemoView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 26/09/23.
//

import SwiftUI

struct SheetDemoView: View {
    @State private var sheetMode: SheetMode = .none
    private var strName : String?
    var body: some View {
        ZStack {
            FlexibleSheet(sheetMode: $sheetMode) {
                VStack {
                    Text("Hello World!")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            }
            
//            Button("Show") {
//
//                switch sheetMode {
//                    case .none:
//                        sheetMode = .quarter
//                    case .quarter:
//                        sheetMode = .half
//                    case .half:
//                        sheetMode = .full
//                    case .full:
//                        sheetMode = .none
//
//                }
//            }
            
            Button {
                switch sheetMode {
                    case .none:
                        sheetMode = .quarter
                    case .quarter:
                        sheetMode = .half
                    case .half:
                        sheetMode = .full
                    case .full:
                        sheetMode = .none
                        
                }
            } label: {
               
                Label("Learn More", systemImage: "book.fill")
                
            }.buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.red)

        }
    }
}

struct SheetDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SheetDemoView()
    }
}
