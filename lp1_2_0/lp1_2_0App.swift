//
//  lp1_2_0App.swift
//  lp1_2_0
//
//  Created by Lewis Campbell on 10/21/24.
//

import SwiftUI
import FirebaseCore

@main
struct lp1_2_0App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
