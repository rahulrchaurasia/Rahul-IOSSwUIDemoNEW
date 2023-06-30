//
//  SubscriberDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/06/23.
//

import SwiftUI
import Combine
class SubscriberViewModel : ObservableObject {
    
    @Published var count : Int = 0
    
    var timer : AnyCancellable?
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldtext : String = ""
    
    @Published var textIsValid : Bool = false
    
    
    
    init(){
         
       // setUpTimer()    // For Count
        addTextFieldSubsscriber() //For TextFiled Validation change Image
    }
    
    func addTextFieldSubsscriber(){
        
        $textFieldtext
        
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if (text.count > 3 )  {
                    return true
                }
                return false
            }
            .sink(receiveValue: { [weak self] (isVlid) in
                
                self?.textIsValid = isVlid
            })
            .store(in: &cancellables )
    }
    
    func setUpTimer(){
        
    Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _  in
                
                guard let self = self else {return}
                // Note : if we used above than no need to used optional
                self.count += 1
                
                if   self.count >= 10 {
                    
                   
                    for item in self.cancellables {
                        
                        item.cancel()
                    }
                }
                    
            }
            .store(in: &cancellables )
    }
}

struct SubscriberDemo: View {
    
    @StateObject var vm = SubscriberViewModel()
    var bgColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    var body: some View {
        
        VStack{
            
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description )
            
        
            
            Text("Hello, World!")
                           .font(.largeTitle)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.black.opacity(0.5))
                           .cornerRadius(10)
                           .overlay(
                               Image(systemName: "star.fill")
                                   .font(.title)
                                   .foregroundColor(.yellow)
                                   .offset(x: 0, y: -40)
                           )
                
            
            TextField("type something..", text: $vm.textFieldtext)
                .padding(.leading)
                .frame(height: 55)
                .background(Color(bgColor).opacity(0.7))
                .cornerRadius(15)
            
                .overlay(
                    
                    ZStack{
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldtext.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0
                            
                            )
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                        .font(.headline)
                        .padding(.trailing)
                    , alignment: .trailing
                    
                )
                
        }
        .padding()
       
    }
}

struct SubscriberDemo_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberDemo()
    }
}
