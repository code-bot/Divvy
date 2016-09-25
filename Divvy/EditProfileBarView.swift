//
//  EditProfileBarView.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation


import Foundation
import UIKit

class EditProfileBarView: UIView {
    
    var yourGroup = UIButton()
    var yourPrefs = UIButton()
    
    func configureButtons() {
        yourGroup.setTitle("My Group", forState: .Normal)
        yourGroup.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 46)
        yourGroup.setTitleColor(DVUIConstants.colors.loginPeach, forState: .Normal)
        yourGroup.backgroundColor = UIColor.clearColor()
        
        yourPrefs.setTitle("My Preferences", forState: .Normal)
        yourPrefs.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 46)
        yourPrefs.setTitleColor(DVUIConstants.colors.loginPeach, forState: .Normal)
        yourPrefs.backgroundColor = UIColor.clearColor()
    }
    func configureView() {
        configureButtons()
        
        let viewDict = [
            "group" : yourGroup,
            "prefs" : yourPrefs
        ]
        
        self.prepareViewsForAutoLayout(viewDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[group][prefs]|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[groups]|", views: viewDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[prefs]|", views: viewDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}