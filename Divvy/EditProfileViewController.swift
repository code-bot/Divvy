//
//  EditProfileViewController.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var editDetailsView = EditProfileDetailsView(frame: CGRect.zero)
    var email = ""
    var fName = ""
    var lName = ""

    
    func configureLabels() {
        editDetailsView.emailID.text = String(Model.sharedInstance.currUser?.email)
        editDetailsView.fName.text = String(Model.sharedInstance.currUser?.fName)
        editDetailsView.lName.text = String(Model.sharedInstance.currUser?.lName)
    }
    func configureButtons() {
        self.editDetailsView.submit.addTarget(self, action: #selector(submitButton), forControlEvents: .TouchUpInside)
    }
//    func configureButtons() {
//        self.editDetailsView.userPhoto.addTarget(self, action: #selector(doSomething), forControlEvents: .TouchUpInside)
//    }
    func submitButton() {
        if email != "" && fName != "" &&  lName != "" {
            print(1)
        }
        if email != "" && fName != "" {
            print(2)
        }
        if email != "" && lName != "" {
            print(3)
        }
        if fName != "" && lName != "" {
            print(4)
        }


        dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    func configureView() {
        
        self.view.backgroundColor = DVUIConstants.colors.darkGrayBackground
        //configureButtons()
        configureLabels()
        
        let viewsDict = [
            "editDetView" : editDetailsView
        ]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[editDetView]|", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-20-[editDetView]", views: viewsDict))
    }
    
    func doSomething() {
        print("hi")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}