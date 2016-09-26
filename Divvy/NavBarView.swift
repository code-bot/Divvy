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
        titleLogoView.contentMode = .scaleAspectFit
    }
    
    func configureButtons() {
        signOut.setTitle("Sign Out", for: UIControlState())
        signOut.backgroundColor = UIColor.clear
        signOut.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
        
        editProfile.setTitle("Edit Profile", for: UIControlState())
        editProfile.backgroundColor = UIColor.clear
        editProfile.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
    }
    
    func configureLogo() {
        
    }
    
    func configureViews() {
        
        
    }
    func configureView() {
        self.backgroundColor = UIColor.clear
        
        configureButtons()
        configureImageViews()
        
        let viewsDict = [
            
            "signOut":   signOut,
            "editProfile": editProfile,
            "logo"      :   titleLogoView,

            ] as [String : UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-5-[logo]-5-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-25-[logo]-25-|", views: viewsDict))

        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-15-[signOut(==\(String(describing: DVUIConstants.signOutHeight)))]-25-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-15-[editProfile(==\(String(describing: DVUIConstants.cameraHeight)))]-25-|", views: viewsDict))
        
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
