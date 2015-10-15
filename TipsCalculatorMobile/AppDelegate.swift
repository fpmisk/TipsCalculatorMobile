//
//  AppDelegate.swift
//  TipsCalculatorMobile
//
//  Created by fpmi on 15.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
    
        var rest = Restaurant();
        rest.rating = 1;
        rest.name = "Bungalo";
        
        var rev1 = Review(restaurant: rest);
        rev1.atmosphere = 3;
        rev1.mealQuality = 4;
        rev1.serviceTime = 34;
        rev1.orderSum = 25.65;
        
        rest.reviews.append(rev1)
        
        for rev: Review in rest.reviews {
            println("Review from restaurant \"\(rest.name)\":")
            println("\tAtmosphere (1-5): \(rev.atmosphere)")
            println("\tMeal quality (1-5): \(rev.mealQuality)")
            println("\tService time in minutes: \(rev.serviceTime)")
            println("\tOrder sum: \(rev.orderSum) $")
            println("\tTips sum: \(rev.calculateTips()) $")
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

