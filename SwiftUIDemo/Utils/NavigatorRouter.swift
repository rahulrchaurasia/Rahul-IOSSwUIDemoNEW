//
//  NavigatorRouter.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 27/07/23.
//

import Foundation
import UIKit
import SwiftUI

class Router<Route: Equatable>: ObservableObject {
    
    var routes = [Route]()
        
    init(initial: Route? = nil) {
        if let initial = initial {
            routes.append(initial)
        }
    }
    
}


// Router
struct RouterHost<Route: Equatable, Screen: View>: UIViewControllerRepresentable {
    
    let router: Router<Route>
    
    @ViewBuilder
    let builder: (Route) -> Screen
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigation = UINavigationController()
        
        for route in router.routes {
            navigation.pushViewController(
                UIHostingController(rootView: builder(route)), animated: false
            )
        }
        
        return navigation
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
    
    typealias UIViewControllerType = UINavigationController
}
