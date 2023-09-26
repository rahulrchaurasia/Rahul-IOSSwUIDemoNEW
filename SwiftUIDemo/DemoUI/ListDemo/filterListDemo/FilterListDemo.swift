//
//  FilterListDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/08/23.
//

/*************** How to hide Diveider in seperator ********************
 
 .listRowSeparator(.hidden) : --> List {  .listRowSeparator(.hidden) }
 
 .contentShape(Rectangle()) :-> for Handling Tap on Transparent area.
  {By default tap is only apply where View content some text/image but not in blank arae}
 Note : We can acheived same by applying background(...)
 
 Swipe Action : Inside  a List we have apply ...
 
 List with checkbosSlection : used selection in LIST
  and .toolbar  EditButton() for this Action
}

 *************************************************************/

import SwiftUI


struct Place : Identifiable {
    
    let id = UUID()
    let name : String
    let photo : String
    
}

func getPlaces() -> [Place]{
    
    return [Place(name: "Denver", photo: "denver"),
            Place(name: "Newyork", photo: "ny"),
            Place(name: "Costa Rica", photo: "costa-rica"),
            Place(name: "Seattle", photo: "seattle"),
            Place(name: "Cuba", photo: "cuba")
    ]
}
struct FilterListDemo: View {
    
    @State private var search : String = ""
    @State private var places  = getPlaces()
    
    @State private var selectedIds = Set<UUID>()
    var body: some View {
       
       // NavigationView {
            
            VStack(alignment: .leading, spacing: 20){
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray)
                                    .foregroundColor(.gray.opacity(0.16))
    
                                    .frame(height: 50)
    
    
    
                    HStack{
                        TextField("Search Here ", text: $search)
                            .textInputAutocapitalization(.none)
    
                        Spacer()
                        Image(systemName: "magnifyingglass")
                    } .padding(.horizontal)
                        
    
    
    
    
                } .padding(.horizontal)
               
        
                VStack{
                    List(places, selection : $selectedIds ){ place in
                        
                        HStack(alignment: .center, spacing: 10){
                            Image(place.photo)
                                .resizable()
                                .frame(width: 100,height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 15                            ) )
                           
                            Text(place.name)
                                .font(.headline)
                            Spacer()
                            
                              
                        }
                        .swipeActions(edge: .leading) {
                            
                            Button {
                                print("Swap Action")
                            } label: {
                                
                               Label("Heart", systemImage: "heart.circle")
  
                                
                            }.tint(.yellow.opacity(0.4))

                        }
                        //.background(Color.red)
                        .listRowSeparator(.hidden)
                        .contentShape(Rectangle())
                        .onTapGesture {
                          
                            print("Item clicked")
                        }
                    }
                    .toolbar {
                       EditButton()
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.blue.opacity(0.2))
                 
                    .searchable(text: $search)
                    
                }
                
            
            }
            .onChange(of: search) { value in
                
                if(!value.isEmpty && value.count > 1) {
                    
    //               var myData = places.filter { place in
    //
    //                   place.name.lowercased().contains( value.lowercased())
    //
    //
    //                }
    //
    //                places = myData
                    
                    places = places.filter{

                        $0.name.lowercased().hasPrefix(value.lowercased())
                    }
                }else{
                    places = getPlaces()
                }
            }
            
            .navigationTitle("Searchable List \(selectedIds.count)")
            .navigationBarTitleDisplayMode(.automatic)
            
            
        
       // }
      
    }
}

struct FilterListDemo_Previews: PreviewProvider {
    static var previews: some View {
        FilterListDemo( )
    }
}
