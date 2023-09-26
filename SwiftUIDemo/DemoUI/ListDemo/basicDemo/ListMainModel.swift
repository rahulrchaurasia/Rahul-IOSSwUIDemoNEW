//
//  ListMainModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 21/07/23.
//

import Foundation

final class ListMainViewModel : ObservableObject {
    
    
    init(){
        
        listData.append(ListMainModel(id: 1, name: "Title1", data: "wedew wfmwmflwf", subData: "Sub data1"))
        listData.append(ListMainModel(id: 2, name: "Title1", data: "his is a long description that wraps into multiple lines. It should not overlap the text below it", subData: "Sub data2"))
        listData.append(ListMainModel(id: 3, name: "Title1", data: "wedew wfmwmflwf", subData: "Sub data3"))
        
        listData.append(ListMainModel(id: 4, name: "Title1", data: "his is a long description that wraps into multiple lines. It should not overlap the text below ithis is a long description that wraps into multiple lines. It should not overlap the text below ithis is a long description that wraps into multiple lines. It should not overlap the text below itf", subData: "Sub data4"))
        listData.append(ListMainModel(id: 5, name: "Title1", data: "wedew wfmwmflwf", subData: "Sub data5"))
        listData.append(ListMainModel(id: 6, name: "Title1", data: "f wfmwmflwf", subData: "Sub data6"))
        
        
        listData.append(ListMainModel(id: 7, name: "Title1", data: "ded fr wfmwmflwf", subData: "Sub data7"))
        listData.append(ListMainModel(id: 8, name: "Title1", data: "his is a long description that wraps into multiple lines. It should not overlap the text below it", subData: "Sub data8"))
        listData.append(ListMainModel(id: 9, name: "Title1", data: "wedew wfmwmflwf", subData: "Sub data9"))
        
    }
    
   // @Published private(set) var listData : [ListMainModel] = []
    
    @Published  var listData = [ListMainModel] ()
    

    
}
