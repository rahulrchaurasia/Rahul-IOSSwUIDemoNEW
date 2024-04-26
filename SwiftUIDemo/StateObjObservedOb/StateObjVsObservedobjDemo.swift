//
//  StateObjVsObservedobjDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/10/23.
//

import SwiftUI

//@ObservedObject : refresh ie set to initial value when mainView is change

struct RandomNumberView : View {
    
    @State private var randNumber  = 0
    var body: some View {
        VStack( spacing: 10){
            
            Text("Count: \(randNumber)")
                .font(.system(size: 22,weight: .semibold))
                .foregroundColor(.brown)
            
            
            Button("Generate random Number") {
                
                randNumber = (0...1000).randomElement()!
            }
            
            
            /// STate vs Object
         
            Divider()
            StateObjVsObservedobjDemo()
        }
    }
    
    
}
struct StateObjVsObservedobjDemo: View {
    
    @ObservedObject var vm = CounterViewModel()
    
    var body: some View {
        
        VStack( spacing: 10){
            
            Text("Count: \(vm.count)")
                .font(.system(size: 22,weight: .semibold))
                .foregroundColor(.brown)
            
            
            Button("Increase Count") {
                
                vm.increasedCount()
            }
        }
    }
}



struct StateObjVsObservedobjDemo_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}
