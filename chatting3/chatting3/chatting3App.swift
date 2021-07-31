//
//  chatting3App.swift
//  chatting3
//
//  Created by 곽보선 on 2021/07/31.
//

import SwiftUI
import UIKit
import Firebase

@main
struct chatting3App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
