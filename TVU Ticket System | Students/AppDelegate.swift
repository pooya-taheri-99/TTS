//
//  AppDelegate.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/1/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let APP_ID = "1A98A5F2-132A-AE25-FFFA-94DCAE88CA00"
    let API_KEY = "C8F690B5-F097-7683-FFF8-B1A997E39F00"
    
    var window: UIWindow?
    
    var backendlessInstance = Backendless.sharedInstance()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        backendlessInstance?.initApp(APP_ID, apiKey: API_KEY)
        setupViewController()
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    private func setupViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = MainViewController()
        window?.rootViewController = mainVC
        mainVC.view.backgroundColor = UIColor.white
        window?.addSubview(mainVC.view)
        window?.makeKeyAndVisible()
    }

}//class

