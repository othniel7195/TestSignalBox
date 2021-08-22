//
//  AppDelegate.swift
//  TestSignalBox
//
//  Created by jimmy on 2021/8/24.
//

import UIKit
import SignalBox

@main
class AppDelegate: SignalBoxAppDelegate {



    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        registerAllModules()
        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

}



extension AppDelegate {
    func registerAllModules() {
        SignalBox.shared.register(module: ModuleAConfig())
        SignalBox.shared.register(module: ModuleBConfig())
    }
}
