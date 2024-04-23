//
//  ProductCardView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/04/24.
//

import SwiftUI


struct ProductCardView: View {
    //"cooking_oil"
    let strImage : String
    var body: some View {
        Group {
            VStack( alignment: .leading,spacing:10 ){
                
                Image(strImage)
                    .resizable()
                    .frame(width: 210,height: 200)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Text("Luxury Swedian Chair")
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack(spacing: 2){
                    
                    ForEach(0..<5){item in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.blue)
                        
                    }
                    Spacer()
                    Text("$200")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                }
                
            }
            
            .frame(width: 210)
            .padding(.all)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.065))
            .clipShape(RoundedRectangle(cornerRadius: 21))
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
    }
}


#Preview {
    ProductCardView(strImage: "cooking_oil")
}
