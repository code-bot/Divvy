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
    
    func configureLabels() {
        editDetailsView.emailID.text = Model.sharedInstance.currUser?.email
        editDetailsView.fName.text = Model.sharedInstance.currUser?.fName
        editDetailsView.lName.text = Model.sharedInstance.currUser?.lName
    }
    
//    func configureButtons() {
//        self.editDetailsView.userPhoto.addTarget(self, action: #selector(doSomething), forControlEvents: .TouchUpInside)
//    }
    
    func configureView() {
        
        self.view.backgroundColor = DVUIConstants.colors.darkGrayBackground
        //configureButtons()
        configureLabels()
        
        let viewDict = [
            "editDetView" : editDetailsView
        ]
        
        self.view.prepareViewsForAutoLayout(viewDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[editDetView(==\(String(DVUIConstants.screenHeight * 0.75))]", views: viewDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[editDetView]|", views: viewDict))
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