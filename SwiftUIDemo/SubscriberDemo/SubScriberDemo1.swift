//
//  SubScriberDemo1.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 30/06/23.
//

/*
 
 In this example, we have a ViewModel class that conforms to ObservableObject and contains two @Published properties: name and age. Inside the ViewModel initializer, we use combineLatest to combine the latest values from these two properties into a new publisher.

 The combineLatest operator emits a new value whenever any of its input publishers emits a new value. In this case, whenever either name or age changes, the closure passed to sink is called with the latest values. In the example, we simply print the values to the console.

 In the ContentView, we create an instance of the ViewModel as a @StateObject to observe changes. We display a TextField for entering the name and a Stepper for adjusting the age. As the user interacts with these views, the combineLatest publisher in the ViewModel will emit the latest values, triggering the closure and printing the updated values.
 */
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest($name, $age)
            .sink { name, age in
                print("Name: \(name), Age: \(age)")
            }
            .store(in: &cancellables)
    }
}
struct SubScriberDemo1: View {
    
    @StateObject private var viewModel = ViewModel()
    var body: some View {

        VStack {
                    TextField("Name", text: $viewModel.name)
                        .padding()
                    
                    Stepper("Age: \(viewModel.age)", value: $viewModel.age, in: 0...10)
                        .padding()
                }
        
        
    }
}

struct SubScriberDemo1_Previews: PreviewProvider {
    static var previews: some View {
        SubScriberDemo1()
    }
}
