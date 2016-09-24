//
//  HomeViewController.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    
    //views
    var homePageView = HomePageView(frame: CGRect(x: DVUIConstants.homeCenterWidthOffset, y: DVUIConstants.homeCenterHeightOffset, width: DVUIConstants.homeWidth, height: DVUIConstants.homeHeight))
    var navBarView = NavBarView(frame: CGRect.zero)
    
    func openCameraButton(sender: AnyObject!) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            dismissViewControllerAnimated(true, completion: { self.customFunction(pickedImage)} )
        }else{
            dismissViewControllerAnimated(true, completion: nil)
        }
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
    
    func customFunction(image: UIImage) {
        let ocrURL = "http://www.ocrwebservice.com/restservices/processDocument?gettext=true&tobw=true&outputformat=txt"
        let data = (Model.sharedInstance.username + ":" + Model.sharedInstance.licenseCode).dataUsingEncoding(NSUTF8StringEncoding)
        let headers = [
            "Authorization": "Basic " + data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0)),
            "Content-Type": "application/json"
        ]
        
        let testImage = UIImage(named: "publix")
        let imageData = UIImagePNGRepresentation(testImage!)
        
        
        Alamofire.upload(.POST, ocrURL, headers: headers, data: imageData!).responseJSON { response in
            
            debugPrint(response)
            if let json = response.result.value {
                print("JSON: \(json)")
                let data = JSON(json)
                let url = data["OutputFileUrl"].URL
                do {
                    let htmlString = try String(contentsOfURL: url!)
                    print(htmlString)
                    var items = [Item]()
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
                    while lineIndex >= -maxLineLength + 1 && !foundNum {
                        if maxLine[maxLine.endIndex.advancedBy(lineIndex)] == "." {
                            foundNum = true
                        } else {
                            lineIndex -= 1
                        }
                    }
                    
                    var charIndex = lines[maxLineIndex].characters.count + lineIndex - 1
                    var i = maxLineIndex
                    var moreItems = true
                    while moreItems && i < lines.count {
                        let line = lines[i]
                        if line == "" {
                            moreItems = false
                        } else if line.characters.count > charIndex {
                            let itemInfo = self.getItemInfo(lines, lineIndex: i, charIndex: charIndex)
                            items.append(Item(itemName: itemInfo.0, price: itemInfo.1))
                        }
                        i += 1
                    }
                    print(items)
                    Model.sharedInstance.items = items
                    
                    self.presentViewController(TransactionViewController(), animated: true, completion: nil)
                    
                } catch let error {
                    print(error)
                }
            }
        }

        
        
    }
    


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureButtons() {
         self.homePageView.camera.addTarget(self, action: #selector(openCameraButton), forControlEvents: .TouchUpInside)
    }
    
    func configureView() {
        configureButtons()
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [DVUIConstants.colors.darkLoginGradientDark.CGColor, DVUIConstants.colors.darkLoginGradientLight.CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)

        
        let viewsDict = [
            "navBar"    : navBarView,
            "home"      : homePageView
        ]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-20-[navBar][home]-20-|", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[navBar]|", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[home]|", views: viewsDict))
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}