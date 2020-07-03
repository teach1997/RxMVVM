//
//  AppDelegate.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func loadInitStoryBoard() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyBoard: UIStoryboard = UIStoryboard(name: Const.initStoryBoard, bundle: Bundle.main)
        let rootVC = storyBoard.instantiateViewController(withIdentifier: Const.rootViewController) as! UIViewController
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        loadInitStoryBoard()
        return true
    }
}

