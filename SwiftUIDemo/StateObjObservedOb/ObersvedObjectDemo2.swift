//
//  ObersvedObjectDemo2.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 01/01/24.
//

import SwiftUI


struct RandomNumberView1 : View {
    
    @ObservedObject var vm = CounterViewModel()
    
    @State private var randNumber  = 0
    var body: some View {
        VStack( spacing: 10){
            
            Text("Count: \(randNumber)")
                .font(.system(size: 22,weight: .semibold))
                .foregroundColor(.brown)
            
            Text("Child-Count: \(vm.count)")
                .font(.system(size: 22,weight: .semibold))
                .foregroundColor(.brown)
            
            Button("Generate random Number") {
                
                randNumber = (0...1000).randomElement()!
            }
            
            
            
            
            /// STate vs Object
         
            Divider()
            ObersvedObjectDemo2(vm: vm)
        }
    }
    
    
}
struct ObersvedObjectDemo2: View {
    //@State var vm = CounterViewModel()
    @ObservedObject var vm : CounterViewModel
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


struct ObersvedObjectDemo2_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView1()
    }
}
