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
    
//    var userPhoto = UIButton()
    var fName = UITextField()
    var lName = UITextField()
    var emailID = UITextField()
    var submit = UIButton()
    
//    func configureButton() {
//        userPhoto.setImage(Model.sharedInstance.currUser!.photo, forState: .Normal)
//    }
    
    func configureButton() {
        submit.setTitle("Submit", for: UIControlState())
        submit.backgroundColor = DVUIConstants.colors.loginPeach
        submit.setTitleColor(UIColor.white, for: UIControlState())
    }
    
    func configureFields() {
        fName.font = UIFont.systemFont(ofSize: 20)
        fName.textColor = UIColor.white
        fName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        fName.layer.borderWidth = 1
        fName.layer.borderColor = DVUIConstants.colors.loginPeach.cgColor
        fName.layer.cornerRadius = 20
        fName.clipsToBounds = true
        fName.autocapitalizationType = .none
        fName.autocorrectionType = .no
        fName.returnKeyType = .next
        lName.enablesReturnKeyAutomatically = true
        lName.font = UIFont.systemFont(ofSize: 20)
        lName.textColor = UIColor.white
        lName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        lName.layer.borderWidth = 1
        lName.layer.borderColor = DVUIConstants.colors.loginPeach.cgColor
        lName.layer.cornerRadius = 20
        lName.clipsToBounds = true
        lName.autocapitalizationType = .none
        lName.autocorrectionType = .no
        lName.returnKeyType = .next
        lName.enablesReturnKeyAutomatically = true
        emailID.font = UIFont.systemFont(ofSize: 20)
        emailID.textColor = UIColor.white
        emailID.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        emailID.layer.borderWidth = 1
        emailID.layer.borderColor = DVUIConstants.colors.loginPeach.cgColor
        emailID.layer.cornerRadius = 20
        emailID.clipsToBounds = true
        emailID.autocapitalizationType = .none
        emailID.autocorrectionType = .no
        emailID.returnKeyType = .next
        emailID.enablesReturnKeyAutomatically = true
    }
    
    func configureView() {
        configureButton()
        configureFields()
        
        let viewDict   =   [
//            "photo"     :   userPhoto,
            "submit"    :   submit,
            "fName"     :   fName,
            "lName"     :   lName,
            "email"     :   emailID
        ] as [String : UIView]
        
        self.prepareViewsForAutoLayout(viewDict)
        
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-5-[photo]-15-[fname]-15-[lname]-15-[email]", views: viewDict))
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-100-[photo]-100-|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[fName]-15-|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-15-[fName]-15-[lName]-15-[email]-15-[submit]-15-|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[lName]-15-|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[email]-15-|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[submit]-15-|", views: viewDict))

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
