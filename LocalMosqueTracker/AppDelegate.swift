//
//  AppDelegate.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/29/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
//        window?.backgroundColor = UIColor(named: "appColor")
        window?.rootViewController = LoginViewController()
        
        return true
    }


}

