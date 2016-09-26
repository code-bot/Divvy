//
//  SignUpViewController.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 8/5/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class EmailSignUpViewController: UIViewController, UITextFieldDelegate {
    
    //Sign Up requirements
    var email = ""
    var password = ""
    var confirmPass = false
    
    //Text Fields
    var emailTF = SignUpTextField(placeholder: "Email")
    var passTF = SignUpTextField(placeholder: "Password")
    var confirmPassTF = SignUpTextField(placeholder: "Confirm Password")
    
    //Buttons
    var cancelBtn = UIButton()
    var continueBtn = UIButton()
    
    
    func configureFields() {
        let _ = [emailTF, passTF, confirmPassTF].map({
            $0.textField.delegate = self
        })
        
        emailTF.textField.keyboardType = .emailAddress
        emailTF.textField.becomeFirstResponder()
    }
    
    func configureButtons() {
        cancelBtn.setTitle("Cancel", for: UIControlState())
        cancelBtn.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
        cancelBtn.backgroundColor = UIColor.clear
        cancelBtn.addTarget(self, action: #selector(cancelSignUp), for: .touchUpInside)
        
        continueBtn.setTitle("Continue", for: UIControlState())
        continueBtn.setTitleColor(UIColor.white, for: UIControlState())
        continueBtn.backgroundColor = DVUIConstants.colors.loginPeach
        continueBtn.addTarget(self, action: #selector(continueSignUp), for: .touchUpInside)
        continueBtn.layer.cornerRadius = 20
    }
    
    
    func configureView() {
        self.view.backgroundColor = DVUIConstants.colors.darkGrayBackground
        
        configureFields()
        configureButtons()
        
        let viewsDict = [
            "cBtn"      :   cancelBtn,
            "eTF"       :   emailTF,
            "pTF"       :   passTF,
            "cpTF"      :   confirmPassTF,
            "conBtn"    :   continueBtn,
        ] as [String : UIView]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-20-[cBtn]-30-[eTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-20-[pTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-20-[cpTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-30-[conBtn(==\(String(describing: DVUIConstants.loginBtnsHeight)))]", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[cBtn]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[eTF(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[pTF(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[cpTF(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[conBtn(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTF.textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let _ = [emailTF.textField, passTF.textField, confirmPassTF.textField].map({
            $0.resignFirstResponder()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func cancelSignUp() {
        Model.sharedInstance.logoutCurrUser()
        self.dismiss(animated: true, completion: nil)
    }
    
    func continueSignUp() {
        let _ = [emailTF.textField, passTF.textField, confirmPassTF.textField].map({
            $0.becomeFirstResponder()
            $0.resignFirstResponder()
        })
        if email != "" && password != "" &&  confirmPass {
            Model.sharedInstance.loginUser(DVUser(email: email, pass: password))
            self.present(AddtionalSignUpViewController(), animated: true, completion: nil)
        } else if email == "" {
            emailTF.textField.becomeFirstResponder()
        } else if password == "" {
            passTF.textField.becomeFirstResponder()
        } else {
            confirmPassTF.textField.becomeFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTF.textField:
            let emailText = emailTF.textField.text
            if let email = emailText , emailText! != "" && isValidEmail(emailText!) {
                self.email = email
                self.emailTF.errorImg.image = DVUIConstants.greenCheckmark
                self.passTF.textField.becomeFirstResponder()
                textField.resignFirstResponder()
            } else {
                self.email = ""
                self.emailTF.errorImg.image = DVUIConstants.redX
            }
            break
        case passTF.textField:
            //check conditions
            let passText = passTF.textField.text
            if let password = passText , passText! != "" && isValidPass(passText!) {
                self.password = password
                self.passTF.errorImg.image = DVUIConstants.greenCheckmark
                self.confirmPassTF.textField.becomeFirstResponder()
                textField.resignFirstResponder()
                if passText == confirmPassTF.textField.text {
                    self.confirmPassTF.errorImg.image = DVUIConstants.greenCheckmark
                }
            } else {
                self.password = ""
                self.passTF.errorImg.image = DVUIConstants.redX
            }
            break
        case confirmPassTF.textField:
            let confirmPassText = confirmPassTF.textField.text
            if let _ = confirmPassText , password != "" && confirmPassText == password {
                self.confirmPass = true
                self.confirmPassTF.errorImg.image = DVUIConstants.greenCheckmark
                textField.resignFirstResponder()
                continueSignUp()
            } else if password == "" || confirmPassText != password {
                self.confirmPass = false
                self.confirmPassTF.errorImg.image = DVUIConstants.redX
                if password == "" {
                    passTF.textField.becomeFirstResponder()
                }
            } else {
                self.confirmPass = true
                self.confirmPassTF.errorImg.image = DVUIConstants.greenCheckmark
            }
            
        default:
            break
        }

        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTF.textField:
            let emailText = emailTF.textField.text
            if let email = emailText , emailText! != "" && isValidEmail(emailText!) {
                self.email = email
                self.emailTF.errorImg.image = DVUIConstants.greenCheckmark
            } else {
                self.email = ""
                self.emailTF.errorImg.image = DVUIConstants.redX
            }
            break
        case passTF.textField:
            //check conditions
            let passText = passTF.textField.text
            if let password = passText , passText! != "" && isValidPass(passText!) {
                self.password = password
                self.passTF.errorImg.image = DVUIConstants.greenCheckmark
            } else {
                self.password = ""
                self.passTF.errorImg.image = DVUIConstants.redX
            }
            break
        case confirmPassTF.textField:
            //check conditions
            let confirmPassText = confirmPassTF.textField.text
            if let _ = confirmPassText , password != "" && confirmPassText == password {
                self.confirmPass = true
                confirmPassTF.errorImg.image = DVUIConstants.greenCheckmark
            } else {
                self.confirmPass = false
                confirmPassTF.errorImg.image = DVUIConstants.redX
            }
            break
        default:
            break
        }
    }
    
    func isValidPass(_ pass: String) -> Bool {
        return pass.characters.count >= 6
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
