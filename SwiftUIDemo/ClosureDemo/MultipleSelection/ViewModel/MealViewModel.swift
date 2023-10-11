//
//  MealViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 06/10/23.
//

import Foundation

//******** Single Selection Logic******/

@MainActor  class MealViewModel :ObservableObject{
    
    
    @Published var mealData : [MealData] = []
    
    @Published var selectedMeal : MealData?
    
    @Published var isShowingDetails = false
    
    //@Published  var selectedItems = Set<String>()
   
    
    init(){
        
        print("Init is Called...")
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
                   if $0.id == meal.id {
                       return MealData(id: $0.id, name: $0.name,
                                                   description: $0.description,
                                                   price: $0.price, imageUrl: $0.imageUrl,
                                       isSelected: !meal.isSelected)

                   } else {
                       return MealData(id: $0.id, name: $0.name,
                                       description: $0.description,
                                       price: $0.price, imageUrl: $0.imageUrl,
                           isSelected: false)
                   }
               }

    }
    
    
    
    
}
