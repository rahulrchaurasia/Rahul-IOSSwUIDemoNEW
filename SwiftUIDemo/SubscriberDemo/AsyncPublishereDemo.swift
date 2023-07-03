//
//  AsyncPublishereDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/07/23.
//

import SwiftUI
import Combine

class AsyncPublisherDataManger{
    
    static let instance  = AsyncPublisherDataManger()
    @Published var myData : [String] = []
    
    func addData() async{
        
        myData.append("Apple")
        try?await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Banana")
        try?await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Orange")
        try?await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Watermelon")
        try?await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("grapes")
        try?await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("guava")
        
    }
}

class  AsyncPublisherViewModel : ObservableObject {
    
    let manger = AsyncPublisherDataManger.instance
   // @Published var dataArray :[String] = []
    
   @MainActor @Published var dataArray :[String] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
        addSubscriber()
    }
    
    
    // called DataManger to get Api Response
    private func addSubscriber(){
        
      
        Task{
            
            for  await value in manger.$myData.values {
                // execute in Main Thread
                await MainActor.run(body: {
                    
                    self.dataArray = value
                })
               
            }
        }
       
        
    }
    
    // called DataManger to get Api Response
    private func addSubscriber1(){
        
        /*
        manger.$myData
            .receive(on: DispatchQueue.main, options: nil)
//            .sink { dataArray in
//                self.dataArray = dataArray
//            }
          // both are same
            .sink(receiveValue: { dataArray in
                self.dataArray = dataArray
            })
            
            
            .store(in: &cancellables )
         
         */
        
    }
    func start() async {
        
        await manger.addData()
        
    }
    
}
struct AsyncPublishereDemo: View {
    
    @StateObject private var vm = AsyncPublisherViewModel()
    var body: some View {
        ScrollView {
            
            VStack{
                
                ForEach(vm.dataArray,id: \.self){
                    
                    Text($0)
                        .font(.largeTitle)
                        .padding(.all,10)
                        .padding(.horizontal,15)
                        .background(Color.green.opacity(0.5))
                        .cornerRadius(20)
                         
                }
            }
        }
        .task {
           
            await vm.start()
        }
    }
}

struct AsyncPublishereDemo_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPublishereDemo()
    }
}
