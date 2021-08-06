//
//  chattingFinalApp.swift
//  chattingFinal
//
//  Created by 곽보선 on 2021/08/06.
//

import SwiftUI
import Firebase
import UIKit


@main
struct chattingFinalApp: App {
    
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
