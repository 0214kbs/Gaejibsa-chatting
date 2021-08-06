//
//  chatting2App.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI
import Firebase
import UIKit


@main
struct chatting3App: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate : NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptionslaunchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
