//
//  OTPAlertViewDynamic.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 03/02/24.
//

import Foundation
import SwiftUI


struct OTPAlertViewDynamic: View {
    @ObservedObject var vm: OTPAlertViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Product")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Meals description")
                        .font(.title2)
                        .multilineTextAlignment(.leading)

                    HStack(alignment: .center, spacing: 10) {
                        Text("Price: ")
                            .font(.title3)
                            .multilineTextAlignment(.leading)

                        Text("240 Rs")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                    }

                    Text(vm.dynamicText)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }

                Divider()
                    .background(Color.blue.opacity(0.4))
                    .padding([.bottom], 20)

                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        
                        DispatchQueue.main.async {
                            vm.isShowingDetails = false
                        }
                      
                    }) {
                        APButton(title: "Done")
                    }
                }
                .padding(.bottom)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                idealHeight: geometry.size.height,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    vm.dismissAlert()
                    print("Close Alert View")
                } label: {
                    XDismissButton()
                }
                .padding(.top, 4)
            }
        }
    }
}



struct OTPAlertViewDynamic_Previews: PreviewProvider {
    static var previews: some View {

        let vm: OTPAlertViewModel = OTPAlertViewModel()
        OTPAlertView(vm: vm)
    }
}
