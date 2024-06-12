//
//  DatePickerViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/06/24.
//

import Foundation

class DatePickerViewModel: ObservableObject{
    
    @Published var selectedDate : Date = .now
    @Published var isAgeOver18 = false
    
  
    init() {
            
        }
    

    func getDateRange() -> ClosedRange<Date> {
        let calander = Calendar.current
        
        let  minAgeDate = calander.date(byAdding: .year, value: -120, to: .now)
        let  maxAgeDate = calander.date(byAdding: .year, value: -18, to: .now)
        
        return minAgeDate!...maxAgeDate!
       }
    
    func getmaxDateRange() -> ClosedRange<Date> {
        let calander = Calendar.current
        
        let  minAgeDate = calander.date(byAdding: .year, value: 18, to: .now)
        let  maxAgeDate = calander.date(byAdding: .year, value: 120, to: .now)
        
        return minAgeDate!...maxAgeDate!
       }
  
     
 
    func formattedDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, yyyy" // Customize date format as needed
            return formatter.string(from: date)
        }

   
}
