//
//  ListComplexDemo.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/12/23.
//

/*
 Note :
 1>The height of the header dynamically adjusts based on the offset:
 If offset > 0: The header expands downward, creating a parallax effect when pulling down.
 If offset < 0: The header height remains static at 250 points.

 d. Dynamic Position Adjustment
 .offset(y: (offset > 0 ? -offset : 0))

 The vertical offset adjusts the position of the header:
 If offset > 0: The header moves upward to counter the downward pull, keeping the top of the header anchored.
 This creates the parallax effect.
 
 
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 The GeometryReader is crucial for:

 Measuring and Monitoring Scroll Effects:

 It tracks the offset of the header relative to the global coordinate space.
 This allows for dynamic height and position adjustments to create a parallax scrolling effect.
 Dynamic UI Updates:

 The header dynamically resizes and repositions itself based on the user's scrolling behavior.
 
 Parallax Effect in Action
 The parallax effect creates a visually engaging experience by making the header expand or contract as the user scrolls.
 The image's size grows or shrinks dynamically, and its position shifts to create depth and interactivity.
 
 
 >>>>>>>>>>>>>>>>>.
 * When you scroll, this offset value changes, allowing you to create dynamic animations
 1. Offset Handling:

 if -offset > 0 {
     DispatchQueue.main.async {
         self.vm.offset = -offset
     }
 }

 Tracks the scroll position and updates the ViewModel
 The negative offset check determines if you're scrolling up


 Image Position Adjustment:

 .offset(y: (offset > 0 ? -offset : 0))
 * Keeps the image anchored to the top when pulling down
 * Creates the "stretching" effect by moving the image up half the stretch distance

 */
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



