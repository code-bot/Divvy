//
//  TitleViewController.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 8/4/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import SwiftyJSON

class TitleViewController: UIViewController {
    
    //ImageViews
    var titleLogoView = UIImageView()
    
    //Views
    var loginHub = LoginHubView(frame: CGRect(x: DVUIConstants.loginHubCenterWidthOffset, y: DVUIConstants.loginHubCenterHeightOffset, width: DVUIConstants.loginHubWidth, height: DVUIConstants.loginHubHeight))
    
    func configureImageViews() {
        titleLogoView.image = DVUIConstants.logoImg
        titleLogoView.contentMode = .ScaleAspectFit
    }
    
    func configureButtons() {
        self.loginHub.loginBtn.addTarget(self, action: #selector(emailLogIn), forControlEvents: .TouchUpInside)
        
        self.loginHub.signUpBtn.addTarget(self, action: #selector(signUp), forControlEvents: .TouchUpInside)
        
        self.loginHub.forgotPassBtn.addTarget(self, action: #selector(passRecovery), forControlEvents: .TouchUpInside)
    }
    
    func configureView() {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [DVUIConstants.colors.darkLoginGradientDark.CGColor, DVUIConstants.colors.darkLoginGradientLight.CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        configureImageViews()
        configureButtons()
        
        let viewsDict = [
            "logo"      :   titleLogoView
        ]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-\(String(DVUIConstants.logoHeightOffset))-[logo(==\(String(DVUIConstants.logoImgViewHeight)))]", views: viewsDict))
        
        let logoWidthOffset = DVUIConstants.screenWidth/2 - (titleLogoView.image?.size.width)!/2

        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-(\(String(logoWidthOffset)))-[logo]", views: viewsDict))
        
        self.view.addSubview(loginHub)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = Model.sharedInstance.currUser {
            FIRAuth.auth()?.signInWithEmail(user.email, password: user.pass, completion: { (user, error) in
                if let error = error {
                    print(error)
                    
                    let alert = UIAlertView()
                    alert.title = "Log In Failed"
                    alert.message = "An unknown error oDVurred. Please make sure you are connected to the internet."
                    alert.addButtonWithTitle("OK")
                    alert.show()
                } else {
                    Model.sharedInstance.loginFIRUSer(user!)
                    
                    self.presentViewController(HomeViewController(), animated: true, completion: nil)
                }
                
            })
        } else {
            loginHub.emailTF.text = ""
            loginHub.passTF.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func emailLogIn() {
        if let email = self.loginHub.emailTF.text where self.loginHub.emailTF.text != "", let password = self.loginHub.passTF.text where self.loginHub.passTF.text != "" {
            
            FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (firUser, error) in
                if let error = error {
                    print(error)
                    
                    self.loginHub.passTF.text = ""
                    
                    let alert = UIAlertView()
                    alert.title = "Log In Failed"
                    alert.message = "Email or password is incorrect"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                } else {
                    Model.sharedInstance.loginFIRUSer(firUser!)
                    
                    let user = DVUser(email: firUser!.email!)
                    
                    Model.sharedInstance.dbRef.child("users").child(firUser!.uid).observeEventType(.Value, withBlock: {
                        (snapshot) in
                        let data = JSON(snapshot.value!)
                        
                        user.fName = data["firstName"].stringValue
                        user.lName = data["lastName"].stringValue
                        let photoUrl = data["photo"].stringValue
                        
                        user.photo = UIImage(data: NSData(base64EncodedString: photoUrl, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)!)
                        
                        
                        user.vegPref = data["veg"].boolValue
                        
                        
                        self.presentViewController(HomeViewController(), animated: true, completion: nil)
                    })
                }
            })
        }
    }
    
    func signUp() {
        presentViewController(EmailSignUpViewController(), animated: true, completion: nil)
    }
    
    func passRecovery() {
        print("forgot pass")
    }
    
    func dismissKeyboard() {
        let fields = [self.loginHub.emailTF, self.loginHub.passTF]
        let _ = fields.map({ $0.resignFirstResponder() })
    }
}
