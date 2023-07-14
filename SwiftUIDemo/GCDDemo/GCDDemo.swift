//
//  GCDDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 12/07/23.
//

import SwiftUI

struct GCDDemo: View {
    var body: some View {
       
        
        Button {
            DEmo1()
        } label: {
            Text("Demo Start")
                .font(.subheadline)
                .padding()
                .background(CustomColor.skyblue)
                .cornerRadius(15)
                
            
        }

    }
}

func DEmo1(){
    
    // Default is serial
   // let queue = DispatchQueue(label: "printNumber")
    let queue = DispatchQueue(label: "printNumber",attributes: .concurrent)
    var number : String = ""
    
    for i in 50...55 {
        
        number += "\(i)"
    }
    
    print(number)
    
    queue.async {
        var number : String = ""
        
        for i in 10...15 {
            number += "\(i) "
        }
        print(number)
    }
   
    
    queue.async {
        var number : String = ""
        
        for i in 0...5 {
            number += "\(i) "
        }
        print(number)
    }
  
    
     number  = ""
    
    for i in 30...35 {
        number += "\(i)"
    }
    print(number)
}

struct GCDDemo_Previews: PreviewProvider {
    static var previews: some View {
        GCDDemo()
    }
}
