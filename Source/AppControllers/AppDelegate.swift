//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit

@UIApplicationMain
public final class AppDelegate: UIResponder {

    // MARK: Stored Properties
    public var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    private let rootViewController: UINavigationController = UINavigationController()
    private lazy var pokedexCoordinator: PokedexAppCoordinator = PokedexAppCoordinator(
        window: self.window!,
        rootViewController: self.rootViewController
    )

    // MARK: Instance Methods
    private func setUpAppAppearance() {
        // UIActivityIndicatorView
        UIActivityIndicatorView.appearance().backgroundColor = UIColor.rsj.color(red: 225, green: 225, blue: 225)
        UIActivityIndicatorView.appearance().style = UIActivityIndicatorView.Style.white
        UIActivityIndicatorView.appearance().color = Colors.red

        if let window = self.window {
            if #available(iOS 13.0, *) {
                window.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
            }
        }
    }
}

extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setUpAppAppearance()
        self.pokedexCoordinator.start()
        return true
    }

    public func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    public func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

