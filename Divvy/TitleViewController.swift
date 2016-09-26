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
        titleLogoView.contentMode = .scaleAspectFit
    }
    
    func configureButtons() {
        self.loginHub.loginBtn.addTarget(self, action: #selector(emailLogIn), for: .touchUpInside)
        
        self.loginHub.signUpBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        self.loginHub.forgotPassBtn.addTarget(self, action: #selector(passRecovery), for: .touchUpInside)
    }
    
    func configureView() {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [DVUIConstants.colors.darkLoginGradientDark.cgColor, DVUIConstants.colors.darkLoginGradientLight.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        configureImageViews()
        configureButtons()
        
        let viewsDict = [
            "logo"      :   titleLogoView
        ]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-\(String(describing: DVUIConstants.logoHeightOffset))-[logo(==\(String(describing: DVUIConstants.logoImgViewHeight)))]", views: viewsDict))
        
        let logoWidthOffset = DVUIConstants.screenWidth/2 - (titleLogoView.image?.size.width)!/2

        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-(\(String(describing: logoWidthOffset)))-[logo]", views: viewsDict))
        
        self.view.addSubview(loginHub)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = Model.sharedInstance.currUser {
            FIRAuth.auth()?.signIn(withEmail: user.email, password: user.pass, completion: { (user, error) in
                if let error = error {
                    print(error)
                    
                    let alert = UIAlertView()
                    alert.title = "Log In Failed"
                    alert.message = "An unknown error oDVurred. Please make sure you are connected to the internet."
                    alert.addButton(withTitle: "OK")
                    alert.show()
                } else {
                    Model.sharedInstance.loginFIRUSer(user!)
                    
                    self.present(HomeViewController(), animated: true, completion: nil)
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
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func emailLogIn() {
        if let email = self.loginHub.emailTF.text , self.loginHub.emailTF.text != "", let password = self.loginHub.passTF.text , self.loginHub.passTF.text != "" {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (firUser, error) in
                if let error = error {
                    print(error)
                    
                    self.loginHub.passTF.text = ""
                    
                    let alert = UIAlertView()
                    alert.title = "Log In Failed"
                    alert.message = "Email or password is incorrect"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                } else {
                    Model.sharedInstance.loginFIRUSer(firUser!)
                    
                    let user = DVUser(email: firUser!.email!)
                    
                    Model.sharedInstance.dbRef.child("users").child(firUser!.uid).observe(.value, with: {
                        (snapshot) in
                        let data = JSON(snapshot.value!)
                        
                        user.fName = data["firstName"].stringValue
                        user.lName = data["lastName"].stringValue
                        let photoUrl = data["photo"].stringValue
                        
                        user.photo = UIImage(data: Data(base64Encoded: photoUrl, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!)
                        
                        
                        user.vegPref = data["veg"].boolValue
                        
                        
                        self.present(HomeViewController(), animated: true, completion: nil)
                    })
                }
            })
        }
    }
    
    func signUp() {
        present(EmailSignUpViewController(), animated: true, completion: nil)
    }
    
    func passRecovery() {
        print("forgot pass")
    }
    
    func dismissKeyboard() {
        let fields = [self.loginHub.emailTF, self.loginHub.passTF]
        let _ = fields.map({ $0.resignFirstResponder() })
    }
}
