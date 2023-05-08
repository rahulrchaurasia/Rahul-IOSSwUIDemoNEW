//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/03/23.
//

/****************************************************************************/
/* 1> @EnvironmentObject:-  refer / SwiftUIDemoApp (for storing data)
    
   Using EnvironmentObject we can get viewModel data in overall hierarchy.
 
   2> @StateObject : we can also used it. but we have to mainiatin it from
   one view to another view by passing as argument.
   
 */
/****************************************************************************/
import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
   // @StateObject

    
    var body: some View {
        ZStack{
            
            if(listViewModel.items.isEmpty){
               NoItemsView()
            }else{
                 List{
                   
                    ForEach(listViewModel.items) { item in
                      
                        ListRowView(item: item)
                            //Mark :  
                 //**** we used onTapGesture for click**//
                            .onTapGesture{
                                withAnimation(.linear){
                                    
                                    listViewModel.updateItem(editModel: item)
                                }
                            }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
       
        .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink( "Add", destination: {
                         AddView()
                    }
                   )
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {      // bec we added NavigationView in root                     so for preview we added here also.
            ListView()
        }.environmentObject(ListViewModel())
    }
}

