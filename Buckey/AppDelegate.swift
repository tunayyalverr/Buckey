//
//  AppDelegate.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let shared = UIApplication.shared.delegate as! AppDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let list = ListRouter.createListModule()
        let navigation = BaseNavigationController(rootViewController: list)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        return true
    }
    
    //MARK: - Set Intro screen to application window
    func goToScreen(view: UIViewController) {
        UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UIView.performWithoutAnimation({
                self.window?.rootViewController = view
            })
        }, completion: nil)
    }

}

