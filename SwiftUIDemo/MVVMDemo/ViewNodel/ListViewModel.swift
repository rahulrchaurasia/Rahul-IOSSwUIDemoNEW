//
//  ListViewModel.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/03/23.
//

/***************************************************************/
/*  Handling User Defaults Using codable:-
    Since We use ViewModel which is class we have to used
    User-Defaults, if we used UI-View we can used AppStorage also
 
    ListViewModel : In 'items' field we have all logic hence we have published it
   using  @Published key so all view can Observed it using
    * @ObservedObject  : For SubView :- Used in Child UI-View
    * @StateObject : Use This on creation/init ie ui-view which directly access viewmodel
    * @EnvironmentObject : For All UIView :- we have to add viewmodel in EnvironmentObject than we can got everywhere in hierarchy.EnvironmentObject add to parent Navigation root.
 
   For Published any field class ie ListViewModel must inherit ObservableObject
 */
/***************************************************************/
import Foundation
class ListViewModel : ObservableObject {
    
    @Published var items : [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        
//        let newItems = [
//
//            ItemModel(title: "This is first Item", isCompleted: false),
//            ItemModel(title: "This is second Item", isCompleted: false),
//            ItemModel(title: "This is third Item", isCompleted: false),
//            ItemModel(title: "This is four Item", isCompleted: true)
//         ]
//
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: UserDefaultKEY.ItemKey),
            let saveItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
         
        self.items = saveItem
       
        
                
        
    }
    
    func addItem(title : String){
        
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(editModel : ItemModel){
        
        if let index = items.firstIndex(where: {$0.id == editModel.id}){
            
            items[index] = editModel.updateCompletion()
        }
        
     
    }
    
    func saveItems(){
        
        if let encodedData = try? JSONEncoder().encode(items){
            
            UserDefaults.standard.set(encodedData, forKey: UserDefaultKEY.ItemKey)
        }
            
    }
    
    
}
