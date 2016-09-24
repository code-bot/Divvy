//
//  AdditionalSignUpViewController.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 8/8/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class AddtionalSignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Sign Up requirements
    var firstName = ""
    var lastName = ""
    var photo = DVUIConstants.noPhoto
    
    //Textfields
    var firstNameTF = SignUpTextField(placeholder: "First Name")
    var lastNameTF = SignUpTextField(placeholder: "Last Name")
    
    //Buttons
    var backBtn = UIButton()
    var signUpBtn = UIButton()
    
    //Views
    var photoSel = PhotoSelector()
    
    //Check boxes
    var vegCheckBox = CheckBox()
    
    func configureFields() {
        let _ = [firstNameTF, lastNameTF].map({
            $0.textField.delegate = self
        })
        
        firstNameTF.textField.becomeFirstResponder()
    }
    
    func configureButtons() {
        backBtn.setImage(DVUIConstants.peachBack, forState: .Normal)
        backBtn.imageView?.contentMode = .ScaleAspectFit
        backBtn.setTitleColor(DVUIConstants.colors.loginPeach, forState: .Normal)
        backBtn.backgroundColor = UIColor.clearColor()
        backBtn.addTarget(self, action: #selector(backSignUp), forControlEvents: .TouchUpInside)
        
        signUpBtn.setTitle("Sign Up", forState: .Normal)
        signUpBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signUpBtn.backgroundColor = DVUIConstants.colors.loginPeach
        signUpBtn.addTarget(self, action: #selector(signUp), forControlEvents: .TouchUpInside)
        signUpBtn.layer.cornerRadius = 20
    }
    
    func configurePhotoSelector() {
        let selfTap = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        selfTap.numberOfTapsRequired = 1
        photoSel.addGestureRecognizer(selfTap)
        photoSel.imagePicker.delegate = self
    }
    
    func configureCheckBox() {
        vegCheckBox.label.text = "I am Vegetarian"
        vegCheckBox.label.textColor = DVUIConstants.colors.loginPeach
    }
    
    func configureView() {
        self.view.backgroundColor = DVUIConstants.colors.darkGrayBackground
        
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        configureFields()
        configureButtons()
        configurePhotoSelector()
        configureCheckBox()
        
        let viewsDict = [
            "bBtn"      :   backBtn,
            "fnTF"      :   firstNameTF,
            "lnTF"      :   lastNameTF,
            "pSel"      :   photoSel,
            "vChk"      :   vegCheckBox,
            "sUP"       :   signUpBtn
        ]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-25-[bBtn(==30)]-10-[pSel]-25-[fnTF(==\(String(DVUIConstants.textFieldHeight)))]-20-[lnTF(==\(String(DVUIConstants.textFieldHeight)))]-20-[vChk(==20)]-20-[sUP(==\(String(DVUIConstants.textFieldHeight)))]", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[bBtn(==40)]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(DVUIConstants.textFieldCenterWidthOffset))-[fnTF(==\(String(DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(DVUIConstants.textFieldCenterWidthOffset))-[lnTF(==\(String(DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(DVUIConstants.textFieldCenterWidthOffset - 10))-[vChk]-\(String(DVUIConstants.textFieldCenterWidthOffset - 10))-|", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(DVUIConstants.textFieldCenterWidthOffset))-[sUP(==\(String(DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(DVUIConstants.photoSelOffset))-[pSel]", views: viewsDict))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        firstNameTF.textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let _ = [firstNameTF, lastNameTF].map({
            $0.textField.resignFirstResponder()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func signUp() {
        let _ = [firstNameTF, lastNameTF].map({
            $0.textField.becomeFirstResponder()
            $0.textField.resignFirstResponder()
        })
        if firstName != "" && lastName != "" {
            print("done signing up")
            
            Model.sharedInstance.currUser!.fName = self.firstName
            Model.sharedInstance.currUser!.lName = self.lastName
            Model.sharedInstance.currUser!.photo = self.photo
            Model.sharedInstance.currUser!.vegPref = self.vegCheckBox.isChecked
            //Do signup stuff in backend
            FIRAuth.auth()?.createUserWithEmail(Model.sharedInstance.currUser!.email, password: Model.sharedInstance.currUser!.pass, completion: { (user, error) in
                if let error = error {
                    print(error)
                    
                } else {
                    let jpgData = UIImageJPEGRepresentation(self.photo!, 1.0)
                    let photoStr = jpgData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
                    
                    Model.sharedInstance.dbRef.child("users").child(user!.uid).setValue(["firstname" : self.firstName, "lastname" : self.lastName, "photo" : photoStr!, "veg" : self.vegCheckBox.isChecked])
                    
                    self.presentingViewController!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
                }
            })
        } else if firstName == "" {
            firstNameTF.textField.becomeFirstResponder()
        } else {
            lastNameTF.textField.becomeFirstResponder()
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoSel.selectedImg.image = pickedImage
            photo = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func chooseImage() {
        photoSel.imagePicker.allowsEditing = false
        photoSel.imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(photoSel.imagePicker, animated: true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField {
        case firstNameTF.textField:
            lastNameTF.textField.becomeFirstResponder()
            textField.resignFirstResponder()
            break
        default:
            break
        }
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        switch textField {
        case firstNameTF.textField:
            let firstNameText = firstNameTF.textField.text
            if let firstName = firstNameText where firstNameText! != "" {
                self.firstName = firstName
                self.firstNameTF.errorImg.image = DVUIConstants.greenCheckmark
            } else {
                self.firstName = ""
                self.firstNameTF.errorImg.image = DVUIConstants.redX
            }
            break
        case lastNameTF.textField:
            let lastNameText = lastNameTF.textField.text
            if let lastName = lastNameText where lastNameText! != "" {
                self.lastName = lastName
                self.lastNameTF.errorImg.image = DVUIConstants.greenCheckmark
            } else {
                self.lastName = ""
                self.lastNameTF.errorImg.image = DVUIConstants.redX
            }
            break
        default:
            break
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField == lastNameTF.textField {
            if let text = textField.text {
                let length = text.utf16.count + string.utf16.count - range.length
                return length <= 10
            }
        }
        return true
    }
    
    func backSignUp() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}