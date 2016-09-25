//
//  EditProfileDetailsView.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class EditProfileDetailsView: UIView {
    
    var userPhoto = UIButton()
    var fName = UITextField()
    var lName = UITextField()
    var emailID = UITextField()
    
    func configureButton() {
        userPhoto.setImage(Model.sharedInstance.currUser!.photo, forState: .Normal)
    }
    
    func configureFields() {
        fName.font = UIFont.systemFontOfSize(20)
        fName.textColor = UIColor.whiteColor()
        fName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        fName.layer.borderWidth = 1
        fName.layer.borderColor = DVUIConstants.colors.loginPeach.CGColor
        fName.layer.cornerRadius = 20
        fName.clipsToBounds = true
        fName.autocapitalizationType = .None
        fName.autocorrectionType = .No
        fName.returnKeyType = .Next
        lName.enablesReturnKeyAutomatically = true
        lName.font = UIFont.systemFontOfSize(20)
        lName.textColor = UIColor.whiteColor()
        lName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        lName.layer.borderWidth = 1
        lName.layer.borderColor = DVUIConstants.colors.loginPeach.CGColor
        lName.layer.cornerRadius = 20
        lName.clipsToBounds = true
        lName.autocapitalizationType = .None
        lName.autocorrectionType = .No
        lName.returnKeyType = .Next
        lName.enablesReturnKeyAutomatically = true
        emailID.font = UIFont.systemFontOfSize(20)
        emailID.textColor = UIColor.whiteColor()
        emailID.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        emailID.layer.borderWidth = 1
        emailID.layer.borderColor = DVUIConstants.colors.loginPeach.CGColor
        emailID.layer.cornerRadius = 20
        emailID.clipsToBounds = true
        emailID.autocapitalizationType = .None
        emailID.autocorrectionType = .No
        emailID.returnKeyType = .Next
        emailID.enablesReturnKeyAutomatically = true
    }
    
    func configureView() {
        
    }
    
    
    
    
}