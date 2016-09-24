//
//  AppDelegate.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        
        //        let str = "   Publix.\nSt. James Center Publix 569-7920\nStore Manager:\n\n\nLYSOL PACIFIC FRES\n1    2 FOR   2.69        1.35 T\nAd Spec Savings 1.34\nMOTT APLE SCE ORG\n1 4  2 FOR    2.73       1.37 t F\nAd Spec Savings 1.36\nMOTT APLE SCE ORG\n1    2 FOR    2.73       1.36 t F\nAd Spec Savings 1.36\nLINDSAY PITT OLIVE\n1    2 FOR    1.75       0.88 t F\nAd Spec Savings 1.11\nLINDSAY PITT OLIVE\n1 @  2 FOR    1.75       0.87 t F\nAd Spec Savings 1.11\nKRFT SPDRMAN MC/CH       0.50 t F\nAd Spec Savings 0.49\nKRFT SPDRMAN MC/CH       0.50 t F\nAd Spec Savings 0.49\nKRFT SPDRMAN MC/CH       0.50 t F\nAd Spec Savings 0.49\nKRFT SPDRMAN MC/CH       0.50 t F\nAd Spec Savings 0.49\nVendor Coupon            -0.50\nFMultiplied Cpn          -0.50 t F\n\nOrder Total             6.83\nSales Tax             0,09"
        //        print(str)
        
        
        //        Food Tax              0.06
        //        Grand Total             6.98
        //        Debit         Payment      6.98
        //
        //        PRESTO!
        //        Reference #: 066608-003
        //        Trace #:
        //        Acct #:
        //        Debit ,
        //        Amount: $6.98
        //
        //        Change                     0.00
        //
        //        Your Total Savings
        //        Vendor Coupon              0.50
        //        Store Coupon               0.50
        //        Advertised Special Savings 8.24
        //        Your Savings at Publix      9.24
        //
        //
        //        Your cashier was
        //
        //        P.O. Box 407
        //        Lakeland, FL 33802-0407
        //
        //        11/17/9nnR 17 Fl q141 R105 3759 CO27"
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = TitleViewController()
        window?.makeKeyAndVisible()
        
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

