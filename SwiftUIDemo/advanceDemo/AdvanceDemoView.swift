//
//  AdvanceDemoView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/10/23.
//

import SwiftUI

struct AdvanceDemoView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
          
                NavigationLink {
                    RandomNumberView()
                } label: {
                    Text("StateObj Vs Observed Obj")
                        .padding(12)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(15)
                        
                }
                
                
                
            NavigationLink {
                StateVsObservedObj()
            } label: {
                Text("StateObj/Observed with ViewMode")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.skyblue)
                    .cornerRadius(15)

            }
            
            NavigationLink {
                GeometryReaderMain()
            } label: {
                Text(" Geometry Reader Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.purple.opacity(0.7))
                    .cornerRadius(15)

            }
            NavigationLink {
               AutoOTP()
            } label: {
                Text("Auto Otp Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.orange.opacity(0.7))
                    .cornerRadius(15)

            }
            NavigationLink {
                OTPMainDemo()
            } label: {
                Text("Otp Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)

            }
            
            NavigationLink {
                CustomDialogDemo()
            } label: {
                Text("Custom Dialog Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.red.opacity(0.7))
                    .cornerRadius(15)

            }
          
            
            NavigationLink {
                CamGalleryUIDemo()
            } label: {
                Text("Camera Gallery Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)

            }
            
            
            NavigationLink {
                CamGalleryDem2()
            } label: {
                Text("Camera Gallery Demo 2")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.skyblue.opacity(0.7))
                    .cornerRadius(15)

            }
            
            //CamGallery
          
            //SupportUserView
            
            NavigationLink {
                SupportMessageView()
            } label: {
                Text(" Support Header Demo")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.systemBlue.opacity(0.9))
                    .cornerRadius(15)

            }
            NavigationLink {
                APICallDemo1()
            } label: {
                Text(" API Call Demo1")
                    .padding(12)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.mint.opacity(0.9))
                    .cornerRadius(15)

            }
            
           Spacer()
        }.padding(.top,10)
    }
}



struct AdvanceDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AdvanceDemoView()
    }
}
