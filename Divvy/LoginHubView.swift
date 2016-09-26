//
//  LoginHubView.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 8/4/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class LoginHubView: UIView, UITextViewDelegate {
    
    //Buttons
    var loginBtn = UIButton()
    var forgotPassBtn = UIButton()
    var signUpBtn = UIButton()
    
    //Text Fields
    var emailTF = UITextField()
    var passTF = UITextField()
    
    //Labels
    var welcomeLabel = UILabel()
    
    //Views
    var extraBtns = UIView()
    var quickLoginBtns = UIView()
    
    func configureButtons() {
        loginBtn.setTitle("Login", for: UIControlState())
        loginBtn.backgroundColor = DVUIConstants.colors.loginPeach
        loginBtn.setTitleColor(UIColor.white, for: UIControlState())
        
        loginBtn.layer.cornerRadius = 20
        
        forgotPassBtn.setTitle("Forgot Password?", for: UIControlState())
        forgotPassBtn.backgroundColor = UIColor.clear
        forgotPassBtn.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
        
        signUpBtn.setTitle("Create Account", for: UIControlState())
        signUpBtn.backgroundColor = UIColor.clear
        signUpBtn.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
    }
    
    func configureFields() {
        let _ = [emailTF, passTF].map({
            $0.font = UIFont.systemFont(ofSize: 20)
            $0.textColor = UIColor.white
            
            $0.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = DVUIConstants.colors.loginPeach.cgColor
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.autocapitalizationType = .none
            $0.autocorrectionType = .no
            $0.returnKeyType = .next
            $0.enablesReturnKeyAutomatically = true
        })
        
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        passTF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        passTF.isSecureTextEntry = true
        
        emailTF.keyboardType = .emailAddress
    }
    
    func configureLabels() {
        welcomeLabel.text = "FIND YOUR BALANCE"
        welcomeLabel.textColor = DVUIConstants.colors.loginPeach
        welcomeLabel.textAlignment = .center
        
    }
    
    func configureViews() {
        let viewsDict = [
            "sUBtn" :   signUpBtn,
            "fPBtn" :   forgotPassBtn
        ]
        
        self.extraBtns.prepareViewsForAutoLayout(viewsDict)
        
        if forgotPassBtn.intrinsicContentSize.width + 20 < DVUIConstants.screenWidth {
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[fPBtn]|", views: viewsDict))
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[sUBtn]|", views: viewsDict))
            
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-5-[fPBtn]", views: viewsDict))
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[sUBtn]-5-|", views: viewsDict))
        } else {
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[fPBtn]-10-[sUBtn]", views: viewsDict))
            
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-5-[fPBtn]", views: viewsDict))
            self.extraBtns.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[sUBtn]-5-|", views: viewsDict))
        }
        
        
    }
    
    func configureView() {
        self.backgroundColor = UIColor.clear
        
        configureFields()
        configureButtons()
        configureLabels()
        configureViews()
        
        let viewsDict = [
            "eTF"   :   emailTF,
            "pTF"   :   passTF,
            "logBtn":   loginBtn,
            "wLbl"  :   welcomeLabel,
            "xBtns" :   extraBtns
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-15-[wLbl]-15-[eTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-15-[pTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-15-[logBtn(==\(String(describing: DVUIConstants.loginBtnsHeight)))]-10-[xBtns]", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[wLbl]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[eTF]-15-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[pTF]-15-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[logBtn]-15-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[xBtns]-15-|", views: viewsDict))
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
