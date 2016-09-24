//
//  HomeViewController.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    
    //views
    var homePageView = HomePageView(frame: CGRect(x: DVUIConstants.homeCenterWidthOffset, y: DVUIConstants.homeCenterHeightOffset, width: DVUIConstants.homeWidth, height: DVUIConstants.homeHeight))
    
    
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
    
    func customFunction(image: UIImage) {
        print("Do Something with Image @Sahaj")
        self.presentViewController(TransactionViewController(), animated: true, completion: nil)
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

        
//        let viewsDict = [
//            "logo"      :   titleLogoView
//        ]
//        
//        self.view.prepareViewsForAutoLayout(viewsDict)
    
        self.view.addSubview(homePageView)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}