//
//  AnimationDemoMain.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 23/07/25.
//

import SwiftUI

struct AnimationDemoMain: View {
    var body: some View {
        ScrollView(showsIndicators: false ){
            
            VStack {
                
                NavigationLink {
                   
                    
                    CollapsingHeaderView(
                        title: "Premium Coffee",
                        subtitle: "Italian Espresso",
                        rating: "4.9",
                        details: "Premium Selection",
                        image: "food", // Replace with your image name
                        expandedHeight: 260
                    )
                } label: {
                    Text("Collapsing HeaderView")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(15)

                }
                
                NavigationLink {
                   
                    CollapsingToolbarView()
                } label: {
                    Text("Collapsing HeaderView 2")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.7))
                        .cornerRadius(15)

                }
                NavigationLink {
                   
                    AdvancedCollapsingToolbarView()
                } label: {
                    Text("Collapsing HeaderView 3")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(15)

                }
                NavigationLink {
                   
                    StretchyHeaderImageView1()
                } label: {
                    Text("Stretchy Header ImageView")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(15)

                }
                
        
                Divider()
                    .padding(.vertical,20)
                    NavigationLink {
                        CollapseAnimatedStickyHeader()
                    } label: {
                        Text("Advance CollapseAnimatedStickyHeader")
                            .padding(12)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(.mint)
                            .cornerRadius(15)
                            
                    }
                    
                    
                    
                    NavigationLink {
                        
                        // callback using closure method...
                        
                        DemoScrollTabsView()
                    } label: {
                        Text("ScrollView with Tanb Animation")
                            .padding(12)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(.orange.opacity(0.7))
                            .cornerRadius(15)
                            
                    }
             
                    
                    NavigationLink {
                         ContactsDetailView()
                    } label: {
                        Text("Contact Demo")
                            .padding(12)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(.pink.opacity(0.7))
                            .cornerRadius(15)
                            
                    }
                    
                    NavigationLink {
                        TextFieldDemo4()
                    } label: {
                        Text("Two Column at Proper Ratio")
                            .padding(12)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(.purple.opacity(0.7))
                            .cornerRadius(15)
                            
                    }
                    
               Spacer()
            }.padding(.top,10)
        }
    
       
    }
}

#Preview {
    AnimationDemoMain()
}


