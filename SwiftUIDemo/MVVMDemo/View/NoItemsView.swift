//
//  NoItemsView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 29/03/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animte : Bool = false
    var body: some View {
        
        ScrollView{
            VStack(alignment: .center, spacing: 10){
                Text("There are No Items!!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("For Adding the data, Please click on Add Tab.we can update also the existing data list.")
                    .padding(.bottom,20)
                NavigationLink {
                    AddView()
                        .transition(AnyTransition.opacity.animation(.easeIn ))
                } label: {
                   Text("Navigate 🤗")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, idealHeight: 60)
                      
                        //.background(Color("orange"))
                        .background(animte ? Color("orange") : Color.accentColor)
                        .cornerRadius(20)
                      
                }.padding(.horizontal,animte ? 30 : 60)
                    .shadow(
                        color: animte ? Color.red.opacity(0.7)
                        : Color.accentColor.opacity(0.7),
                        radius: animte ? 30 : 15,
                        x: 0,
                        y: animte ? 50 : 30)
                    .scaleEffect(animte ? 1.1 : 1.0)
                    .offset(y: animte ? -7 : 0)
                
                
                Circle()
                    .frame(width: 80,height: 80)
                    .overlay(
                        VStack(alignment: .leading, spacing: 0){
                            Text("1")
                            .foregroundColor(Color.white)
                            .font(.system(size: 30))
                            Spacer()
                            
                            Text("2")
                            .foregroundColor(Color.white)
                            .font(.system(size: 30))
                        }
                       
                    )

            }
            .multilineTextAlignment(.leading)
            .padding(.top, 40)
            .padding(.horizontal,20)
            .onAppear(perform: addAnimation)
            
        
           
        }
        .frame( maxWidth: .infinity,  maxHeight: .infinity)
      
    }
    
    func addAnimation(){
        
        guard !animte else {return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
              Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            
            ){
                
                animte.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
       
    }
}
