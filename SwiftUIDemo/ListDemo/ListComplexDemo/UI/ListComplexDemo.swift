//
//  ListComplexDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/12/23.
//

import SwiftUI


struct ListComplexDemo: View {
    
    
    
    @StateObject var vm = SweetProductVM()
    
    @State private var selectedProduct: SweetProduct?
   

    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
    
    var body: some View {
       
        ZStack{
            Color(.bg).opacity(0.2)
                .ignoresSafeArea()
            ScrollView (showsIndicators: false){

             LazyVStack(alignment: .leading, spacing: 15, pinnedViews: .sectionHeaders, content: {
                        
                        // start 05
                 
                 
                 // Parallax header
                      ParallexHeader
                 
                       // end 05
                        Section {
                                
                            ForEach(vm.sweetProductList){ product in
                                
                                SweetProductItem(product: product, isSelected: product.id == selectedProduct?.id) {
                                   
                                    withAnimation(.easeInOut){

                                        
                                        selectedProduct = product.id == selectedProduct?.id ? nil : product
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        header: {
                            
                            if let prod = vm.sweetProductList.first{
                                headerViewComplex(product: prod){
                                    
                                    handleDismissAll()
                                }
                                  
                            }
                          
                          
                        }
                        
                    })
     
            }
            
            //For setting the additional background on safe area hence pinned effect show
            .overlay(alignment: .top) {
               
               
                Color.primaryApp.opacity(0.9)
                    .frame(height: .topInsets)
                    .ignoresSafeArea(.all,edges: .top)
            }
           
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // Hide the back button
        
        .onAppear(){
                     
            vm.getSweetProduct()
                   
        }
           
      
        
       
      
           
    }
}


private extension ListComplexDemo {
    
    func handleDismissAll(){
        
        if #available(iOS 15, *){
            
            dismiss()
        }else{
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var ParallexHeader: some View {
        GeometryReader { reader -> AnyView in
            let offset = reader.frame(in: .global).minY
            print("offset \(offset) ")
            if -offset > 0 {
                DispatchQueue.main.async {
                    self.vm.offset = -offset
                }
            }
            return AnyView(
                Image("bakery_snacks")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: 250 + (offset > 0 ? offset : 0)
                        // Adjusts height dynamically
                    )
                    .cornerRadius(2)
                    .offset(y: (offset > 0 ? -offset : 0))
                    // Moves image upwards during scroll
                    .overlay(
                        HStack {
                            Button(action: {
                                
                                handleDismissAll()
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                
                                print("Item Selected")
                                
                            }, label: {
                                Image(systemName: "suit.heart.fill")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            })
                        }
                            .padding()
                        , alignment: .top
                    )
            )
        }
        .frame(height: 250) // Sets a fixed frame height for the GeometryReader
    }
}


#Preview {
    ListComplexDemo()
}



