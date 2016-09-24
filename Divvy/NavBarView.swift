//
//  HomePageView.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class NavBarView: UIView, UITextViewDelegate {
    
    

    //Buttons
    var signOut = UIButton()
    var editProfile = UIButton()
    
    func configureButtons() {
        signOut.setTitle("Sign Out", forState: .Normal)
        signOut.backgroundColor = UIColor.clearColor()
        signOut.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        editProfile.setTitle("Edit Profile", forState: .Normal)
        editProfile.backgroundColor = UIColor.clearColor()
        editProfile.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func configureLogo() {
        
    }
    
    func configureViews() {
        
        
    }
    func configureView() {
        self.backgroundColor = DVUIConstants.colors.loginPeach
        
        configureButtons()
        
        
        let viewsDict = [
            
            "signOut":   signOut,
            "editProfile": editProfile,
            
            ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[signOut(==\(String(DVUIConstants.signOutHeight)))]-25-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[editProfile(==\(String(DVUIConstants.cameraHeight)))]-25-|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[signOut]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[editProfile]-15-|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
