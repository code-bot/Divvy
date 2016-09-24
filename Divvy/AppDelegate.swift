//
//  AppDelegate.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit
//import Alamofire
import Firebase
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let licenseCode = "015B4210-1C16-4485-868B-D8EFFE7D1A61"
    let username = "sahajbot"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        
        let ocrURL = "http://www.ocrwebservice.com/restservices/processDocument?gettext=true&tobw=true&outputformat=txt"
        let data = (username + ":" + licenseCode).dataUsingEncoding(NSUTF8StringEncoding)
        let headers = [
            "Authorization": "Basic " + data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0)),
            "Content-Type": "application/json"
        ]
        let image = UIImage(named: "publix")
//        let imageData = UIImagePNGRepresentation(image!)
//        Alamofire.upload(.POST, ocrURL, headers: headers, data: imageData!).responseJSON { response in
//            debugPrint(response)
//            
//            if let json = response.result.value {
//                print("JSON: \(json)")
//                let data = JSON(json)
//                let url = data["OutputFileUrl"].URL
//                do {
//                    let htmlString = try String(contentsOfURL: url!)
//                    print(htmlString)
//                    let items = []
//                    var lines = [String]()
//                    htmlString.enumerateLines {
//                        lines.append($0.line)
//                    }
//                    var blanksReached = false
//                    var index = 1
//                    while index < lines.count && !blanksReached {
//                        if lines[index - 1] == "" && lines[index] == "" {
//                            blanksReached = true
//                        } else if lines[index] != "" {
//                            index += 2
//                        } else {
//                            index += 1
//                        }
//                    }
//                    
//                    var maxLineLength = lines[index + 1].characters.count
//                    var maxLineIndex = index + 1
//                    for i in 2..<4 {
//                        let length = lines[index + i].characters.count
//                        if length < maxLineLength {
//                            maxLineLength = length
//                            maxLineIndex = index + i
//                        }
//                    }
//                    
//                    var lineIndex = 0
//                    var foundNum = false
//                    let maxLine = lines[maxLineIndex]
//                    while lineIndex >= -maxLineLength + 1 && !foundNum {
//                        if maxLine[maxLine.endIndex.advancedBy(lineIndex)] == "." {
//                            foundNum = true
//                        } else {
//                            lineIndex -= 1
//                        }
//                    }
//                    
//                    
//                    
//                    
//                    
//                } catch let error {
//                    print(error)
//                }
//            }
//        }
        
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

