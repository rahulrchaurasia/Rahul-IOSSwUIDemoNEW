//
//  BackgroundDemoMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 08/08/25.
//

import SwiftUI

struct BackgroundDemoMain: View {
    var body: some View {
        ScrollView(showsIndicators: false ){
            
            VStack(spacing : 20) {
                
       
                NavigationLink {
                   
                    PDFDownloadView()
                } label: {
                    Text("PDFDownload Demo Using Baground")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(15)

                }
                
                NavigationLink {
                   
                    QuickLookPreview()
                } label: {
                    Text("QuickLook for PDF Preview")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(15)

                }
                
                NavigationLink {
                   
                    StretchyHeaderImageView1()
                } label: {
                    Text("Stretchy Header ImageView")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(15)

                }
                
        
                Divider()
                    .padding(.vertical,20)
                   
                    
                Spacer()
            }.padding(.top,10)
        }
    
       
    }
}

#Preview {
    BackgroundDemoMain()
}
