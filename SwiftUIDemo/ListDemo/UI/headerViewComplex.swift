//
//  headerViewComplex.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/12/23.
//

import SwiftUI
// //Note : we use background color bec Header i.e stickyheader is over / above the list. if we not used bg color than at scroll header bg is transparent
struct headerViewComplex: View {
    
   
    let product : SweetProduct
    var didClose : (()->())?
    
    var body: some View {
      
        ZStack{
            
            Color.skyblue
            
            VStack(alignment: .leading,spacing: 15,
                    content: {
                
                Text(product.title)
                    .font(.system(size: 22,weight: .semibold))
                
                Text("India,Korea,Italian")
                
                HStack(spacing: 5, content: {
                    
                    Image(systemName: "clock")
                        .font(.caption)
                    
                    Text("30-40 min")
                        .font(.caption)
                    
                    Image(systemName: "star.fill")
                        .font(.caption)
                   
                })
               
                
            })
            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding()
            .overlay(alignment: .topTrailing) {
               
               
             
                
                Button(action: {
                    
                    didClose?()
                    
                }, label: {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                        .padding()
                    
                })
                   
            }
            .padding(.top,10)
            //.padding()
           
        }

      
      
    }
}


struct headerViewComplex_Previews: PreviewProvider {
    static var previews: some View {
        let  productItem =  SweetProduct(id: "1",title: "Chocklate Cake ", description: "Dark Chocklate with truffle", price: "300Rs", image: "cherry")
       
        
        headerViewComplex(product: productItem)
    }
}
