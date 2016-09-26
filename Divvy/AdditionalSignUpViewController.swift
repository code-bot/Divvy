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
        backBtn.setImage(DVUIConstants.peachBack, for: UIControlState())
        backBtn.imageView?.contentMode = .scaleAspectFit
        backBtn.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
        backBtn.backgroundColor = UIColor.clear
        backBtn.addTarget(self, action: #selector(backSignUp), for: .touchUpInside)
        
        signUpBtn.setTitle("Sign Up", for: UIControlState())
        signUpBtn.setTitleColor(UIColor.white, for: UIControlState())
        signUpBtn.backgroundColor = DVUIConstants.colors.loginPeach
        signUpBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
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
        ] as [String : UIView]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-25-[bBtn(==30)]-10-[pSel]-25-[fnTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-20-[lnTF(==\(String(describing: DVUIConstants.textFieldHeight)))]-20-[vChk(==20)]-20-[sUP(==\(String(describing: DVUIConstants.textFieldHeight)))]", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[bBtn(==40)]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[fnTF(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[lnTF(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset - 10))-[vChk]-\(String(describing: DVUIConstants.textFieldCenterWidthOffset - 10))-|", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.textFieldCenterWidthOffset))-[sUP(==\(String(describing: DVUIConstants.textFieldWidth)))]", views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: DVUIConstants.photoSelOffset))-[pSel]", views: viewsDict))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        firstNameTF.textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
            FIRAuth.auth()?.createUser(withEmail: Model.sharedInstance.currUser!.email, password: Model.sharedInstance.currUser!.pass, completion: { (user, error) in
                if let error = error {
                    print(error)
                    
                } else {
                    let jpgData = UIImageJPEGRepresentation(self.photo!, 1.0)
                    let photoStr = jpgData?.base64EncodedString(options: .lineLength64Characters)
                    
                    Model.sharedInstance.dbRef.child("users").child(user!.uid).setValue(["firstname" : self.firstName, "lastname" : self.lastName, "photo" : photoStr!, "veg" : self.vegCheckBox.isChecked])
                    
                    self.presentingViewController!.presentingViewController!.dismiss(animated: true, completion: nil)
                }
            })
        } else if firstName == "" {
            firstNameTF.textField.becomeFirstResponder()
        } else {
            lastNameTF.textField.becomeFirstResponder()
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoSel.selectedImg.image = pickedImage
            photo = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func chooseImage() {
        photoSel.imagePicker.allowsEditing = false
        photoSel.imagePicker.sourceType = .photoLibrary
        
        present(photoSel.imagePicker, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case firstNameTF.textField:
            let firstNameText = firstNameTF.textField.text
            if let firstName = firstNameText , firstNameText! != "" {
                self.firstName = firstName
                self.firstNameTF.errorImg.image = DVUIConstants.greenCheckmark
            } else {
                self.firstName = ""
                self.firstNameTF.errorImg.image = DVUIConstants.redX
            }
            break
        case lastNameTF.textField:
            let lastNameText = lastNameTF.textField.text
            if let lastName = lastNameText , lastNameText! != "" {
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == lastNameTF.textField {
            if let text = textField.text {
                let length = text.utf16.count + string.utf16.count - range.length
                return length <= 10
            }
        }
        return true
    }
    
    func backSignUp() {
        self.dismiss(animated: true, completion: nil)
    }
}
