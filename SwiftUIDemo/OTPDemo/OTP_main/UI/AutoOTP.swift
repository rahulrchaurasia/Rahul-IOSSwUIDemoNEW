//
//  AutoOTP.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 23/02/24.
//

import SwiftUI

struct AutoOTP: View {
    var body: some View {
        
        OTPVerificationView()
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        //        if #available(iOS 15, *){
        //
        //            NavigationView{
        //                OTPVerificationView()
        //                    .navigationTitle("")
        //                    .navigationBarTitleDisplayMode(.inline)
        //                    .navigationBarHidden(true)
        //
        //
        //            }
        //
        //        }else{
        //
        //            NavigationStack{
        //
        //                OTPVerificationView()
        //                    .navigationBarTitleDisplayMode(.inline)
        //                    .toolbar(.hidden,for: .navigationBar)
        //            }
        //
        //        }
        //    }
    }
}

//#Preview {
//    AutoOTP()
//}
