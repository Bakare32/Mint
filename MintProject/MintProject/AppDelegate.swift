//
//  AppDelegate.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var coordinator: MainCoordinator?
    var window: UIWindow?
    let navController = UINavigationController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

extension AppDelegate {
    func overrideApplicationThemeStyle() {
        let hour = Calendar.current.component(.hour, from: Date())
        if #available(iOS 13.0, *) {
//            let userSetTheme = defaults.string(forKey: defaultsKeys.USER_THEME) ?? "SYSTEM"
//            switch userSetTheme {
//            case "DARK":
//                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
//            case "LIGHT":
//                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
//            default:
                if hour >= 7 && hour < 19 {
                    // LIGHT THEME
                    UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
                } else {
                    UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
                }
                //UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .unspecified
            }
    }
}

