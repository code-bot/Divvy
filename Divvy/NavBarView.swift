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
    
    
    //ImageViews
    var titleLogoView = UIImageView()
    
    
    //Buttons
    var signOut = UIButton()
    var editProfile = UIButton()
    
    
    func configureImageViews() {
        titleLogoView.image = DVUIConstants.logoImg
        titleLogoView.contentMode = .ScaleAspectFit
    }
    
    func configureButtons() {
        signOut.setTitle("Sign Out", forState: .Normal)
        signOut.backgroundColor = UIColor.clearColor()
        signOut.setTitleColor(DVUIConstants.colors.loginPeach, forState: .Normal)
        
        editProfile.setTitle("Edit Profile", forState: .Normal)
        editProfile.backgroundColor = UIColor.clearColor()
        editProfile.setTitleColor(DVUIConstants.colors.loginPeach, forState: .Normal)
    }
    
    func configureLogo() {
        
    }
    
    func configureViews() {
        
        
    }
    func configureView() {
        self.backgroundColor = UIColor.clearColor()
        
        configureButtons()
        configureImageViews()
        
        let viewsDict = [
            
            "signOut":   signOut,
            "editProfile": editProfile,
            "logo"      :   titleLogoView,

            ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-5-[logo]-5-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-25-[logo]-25-|", views: viewsDict))

        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-15-[signOut(==\(String(DVUIConstants.signOutHeight)))]-25-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-15-[editProfile(==\(String(DVUIConstants.cameraHeight)))]-25-|", views: viewsDict))
        
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
