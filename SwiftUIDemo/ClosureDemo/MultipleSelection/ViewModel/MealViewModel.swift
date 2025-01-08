//
//  MealViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import Foundation

/*
 Note : objectWillChange.send()  //  Trigger UI update before modifying data
     // Iterate through all meals
 */

//******** Single Selection Logic******/

@MainActor  class MealViewModel :ObservableObject{
    
    
    @Published var mealData : [MealData] = []
    
    //@Published var selectedMeal : MealData?
    @Published private(set) var selectedMeal: MealData?
    
    @Published var isShowingDetails = false
    
    @Published  var errorAlert = false
    
    var alertTitle : String = ""
    //@Published  var selectedItems = Set<String>()
    
   
    //Here we store are Selected Item
    @Published var selectedItems: Set<Int> = [] // Use Set to store selected meal IDs

    
    init(){
        
        print("Init is Called...")
    }
    
    func handleDetailAlert(){
        
        
        if(getSlectedMultiSelectMeals().count == 0){
            
            errorAlert.toggle()
            alertTitle = "Required Atleast one List is selected"
            
            isShowingDetails = false
            
        }else{
            
            isShowingDetails = true
        }
        
        
        
        
    }
    
    func getMeals(){
       
        mealData.removeAll()
        mealData.append(MealData(id: 101, name: "Butter Chicken", description: "Butter with spicy masla, kce cecje", price: 450, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg"))
        
        mealData.append(MealData(id: 102, name: "Blackened Shrimp", description: "Seasoned shrimp from the depths of the Atlantic Ocean.", price: 390, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg"))
        
        mealData.append(MealData(id: 103, name: "Buffalo Chicken Bites", description: "The tasty bites of chicken have just the right amount of kick to them", price: 750, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg"))
        
        mealData.append(MealData(id: 104, name: "Chicken Avocado Spring Roll", description: "These won't last 10 seconds once they hit the table.", price: 850, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg"))
        
        mealData.append(MealData(id: 105, name: "Chicken Dumplings", description: "It's really hard to keep coming up with these descriptions.", price: 850, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-dumplings.jpg"))
        
        
        mealData.append(MealData(id: 106, name: "Chicken Fingers", description: "You can never go wrong with some good tenders", price: 310, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-fingers.jpg"))
        
        
        mealData.append(MealData(id: 107, name: "Chicken Wings", description: "You'll need extra napkins with these tasty treats.", price: 580, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-wings.jpg"))
        
        mealData.append(MealData(id: 108, name: "Fried Cheese Ravioli", description: "I'm getting soooo hungry building this app...", price: 1200, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/fried-cheese-ravioli.jpg"))
        
        mealData.append(MealData(id: 109, name: "Jumbo Tater Tots", description: "Scrumptious tots with a side of ranch", price: 1150, imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/jumbo-tater-tot.jpg"))
        
    }
    
    // get First index from List who match the id
    // and than toggle the List ie true than false vice versa
    func selectMeal1(_ meal: MealData) {
            // Toggle the isSelected property for the selected meal.
            if let index = mealData.firstIndex(where: { $0.id == meal.id }){
                mealData[index].isSelected.toggle()
                selectedMeal = mealData[index]
                print("Change Data",mealData[index].name)
            }else{
                
                
            }
        }
    
    
    //donot Use this
    func selectMeal(_ meal: MealData) {
        

        
//        mealData =  mealData.map { item in
//                   if item.id == meal.id {
//                       return MealData(id: item.id, name: item.name,
//                                                   description: item.description,
//                                                   price: item.price, imageUrl: item.imageUrl,
//                                       isSelected: !meal.isSelected)
//
//                   } else {
//                       return MealData(id: item.id, name: item.name,
//                                       description: item.description,
//                                       price: item.price, imageUrl: item.imageUrl,
//                           isSelected: false)
//                   }
//               }
        
        
        selectedMeal = meal
        mealData =  mealData.map {
            //if id same than reverse the selection
                   if $0.id == meal.id {
                       return MealData(id: $0.id, name: $0.name,
                                                   description: $0.description,
                                                   price: $0.price, imageUrl: $0.imageUrl,
                                       isSelected: !meal.isSelected)

                   } else {
                       // rest list by default  select uncheck
                       return MealData(id: $0.id, name: $0.name,
                                       description: $0.description,
                                       price: $0.price, imageUrl: $0.imageUrl,
                           isSelected: false)
                   }
               }

    }
    
    
//    func toggleSelection(_ meal : MealData){
//        
//      //  meal.isSelected = meal.isSelected.toggle()
//        if let selectedMeal = selectedMeal,selectedMeal.id == meal.id{
//            
//            self.selectedMeal = nil
//        
//        }else{
//            
//            self.selectedMeal = meal
//            
//        }
//        
//    }
//    
    
    
    // Use this
    //Mark :For Single Selection
    func toggleSelection(_ meal : MealData) {
        objectWillChange.send()  //// Trigger UI update before modifying data
            // Iterate through all meals

       
        mealData.indices.forEach { index in
              if mealData[index].id == meal.id {
                mealData[index].isSelected.toggle()
                  
              } else {
                mealData[index].isSelected = false // Ensure only one selection
              }
            }
        }
    
    
    // Use this
    //Mark :For Multiple - Selection
    func toggleMultiSelection(_ meal : MealData){
        
        
        objectWillChange.send() // Trigger UI update before modifying data
        
       
       
//       
//        if(selectedItems.contains(meal.id)){
//
//            selectedItems.remove(meal.id)
//            
//        }else{
//            // Select the meal
//            selectedItems.insert(meal.id)
//          
//        }
        // Update isSelected within mealData (optional)
        
        if let index = mealData.firstIndex(where: { $0.id == meal.id}){
            
            mealData[index].isSelected.toggle()
        }
        
        
        
        
    }
    
    
    // Non-isolated method for background tasks, explicitly marked
    
    func getSlectedMultiSelectMeals()-> [MealData] {
        
        return mealData.filter{$0.isSelected}
        
    
    }
    
    func getSlectedMultiMealsId()-> [MealData] {
        
        return mealData.filter { selectedItems.contains($0.id) }
        
       
    }
    
    // Mark : Not USed
    //For Learning Enumerator
    func updateIsSelected() {
        
        for (index, meal) in mealData.enumerated() {
          mealData[index].isSelected = selectedItems.contains(meal.id)
        }
        
      }
    
    
}
