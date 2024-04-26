//
//  StateVsObservedObj.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/10/23.
//

import SwiftUI

struct StateVsObservedObj: View {
    
    @StateObject var vm = CounterViewModel()
    var body: some View {
        VStack( spacing: 10){
            
            Text("Count: \(vm.count)")
                .font(.system(size: 22,weight: .semibold))
                .foregroundColor(.brown)
            
            
            Button("Increase Count") {
                
                vm.increasedCount()
            }
            
            /// STate vs Object
         
            Divider()
            ChildView1(vm: vm)
        }
        
    }
}

struct ChildView1:  View {
    
    @ObservedObject var vm : CounterViewModel
    var body: some View {
        VStack{
            
            Text("2x Count : \(vm.count * 2)")
            
            Button("Decrease Count") {
                
                vm.decreasedCount()
            }
        }
    }
    
}
struct StateVsObservedObj_Previews: PreviewProvider {
    static var previews: some View {
        StateVsObservedObj()
    }
}
