//
//  AppEnvironment.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/07/23.
//

import Foundation


enum AppEnvironment : String {
    
case dev
    
case  test
    
    var baseURL : URL {
        
        switch self {
            
        case .dev:
            return URL(string: "Https//1")!
        case .test:
            return URL(string: "Https//2")!
            
        }
    }
}

struct ConfigurationEnv {
    
    lazy var environment : AppEnvironment = {
        
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
    }()
}

enum EndPoints {
    
   case allorders
    
    var path : String {
        
        switch self {
            
        case .allorders:
            
            return "/tezt/allorder"
        }
    }
}
