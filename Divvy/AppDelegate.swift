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
        let imageData = UIImagePNGRepresentation(image!)
        
        
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
        
        
        Alamofire.upload(.POST, ocrURL, headers: headers, data: imageData!).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
                let data = JSON(json)
                let url = data["OutputFileUrl"].URL
                do {
                    let htmlString = try String(contentsOfURL: url!)
                    print(htmlString)
                    var items = [(String, Double)]()
                    var lines = [String]()
                    htmlString.enumerateLines {
                        lines.append($0.line)
                    }
                    var blanksReached = false
                    var index = 1
                    while index < lines.count && !blanksReached {
                        if lines[index - 1] == "" && lines[index] == "" {
                            blanksReached = true
                        } else if lines[index] != "" {
                            index += 2
                        } else {
                            index += 1
                        }
                    }
                    
                    //print(lines[index+1])
                    
                    var maxLineLength = lines[index + 1].characters.count
                    var maxLineIndex = index + 1
                    for i in 2..<4 {
                        let length = lines[index + i].characters.count
                        if length > maxLineLength {
                            maxLineLength = length
                            maxLineIndex = index + i
                        }
                    }
                    
                    var lineIndex = -1
                    var foundNum = false
                    let maxLine = lines[maxLineIndex]
//                    print("maxLine")
//                    print(maxLine)
                    while lineIndex >= -maxLineLength + 1 && !foundNum {
                        //print(maxLine[maxLine.endIndex.advancedBy(lineIndex)])
                        if maxLine[maxLine.endIndex.advancedBy(lineIndex)] == "." {
                            foundNum = true
                        } else {
                            lineIndex -= 1
                        }
                    }
                    
                    //print(maxLine[maxLine.endIndex.advancedBy(lineIndex)])
                    
                    //print(self.getItemInfo(lines, lineIndex: maxLineIndex, charIndex: lineIndex - 1))
                    
                    var charIndex = lines[maxLineIndex].characters.count + lineIndex - 1
                    var i = maxLineIndex
                    var moreItems = true
                    while moreItems && i < lines.count {
                        let line = lines[i]
                        if line == "" {
                            moreItems = false
                        } else if line.characters.count > charIndex {
                            items.append(self.getItemInfo(lines, lineIndex: i, charIndex: charIndex))
                        }
                        i += 1
                    }
                    print(items)

                    
                    
                    
                    
                } catch let error {
                    print(error)
                }
            }
        }
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = TitleViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func getItemInfo(lines: [String], lineIndex: Int, charIndex: Int) -> (String, Double) {
        var foundPrice = false
        var notItemName = false
        var price = ""
        var itemName = ""
        let line = lines[lineIndex]
        var i = 0
        while i <= charIndex && !(foundPrice && notItemName) {
            let currChar = line[line.startIndex.advancedBy(charIndex - i)]
            //print(currChar)
            if !foundPrice && currChar == " " {
                foundPrice = true
            } else if !foundPrice {
                price = String(currChar) + price
            }
            if currChar == "." {
                notItemName = true
            } else if foundPrice {
                itemName = String(currChar) + itemName
            }
            i += 1
        }
        if notItemName {
            itemName = lines[lineIndex-1]
        }
        
        price += String(line[line.startIndex.advancedBy(charIndex + 1)]) + String(line[line.startIndex.advancedBy(charIndex + 2)]) + String(line[line.startIndex.advancedBy(charIndex + 3)])
        
        print(itemName)
        print(price)
        
        return (itemName.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
            ), Double(price)!)
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

