//
//  SignUpTextField.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 8/7/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class SignUpTextField: UIView {
    
    var textField = UITextField()
    var errorImg = UIImageView()
    
    func configureFields() {
        textField.font = UIFont.systemFontOfSize(20)
        textField.textColor = UIColor.whiteColor()
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.clipsToBounds = true
        textField.autocapitalizationType = .None
        textField.autocorrectionType = .No
        textField.returnKeyType = .Next
        textField.enablesReturnKeyAutomatically = true
    }
    
    func configureImageViews() {
        errorImg.contentMode = .ScaleAspectFit
    }
    
    func configureViews() {
        self.backgroundColor = UIColor.clearColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = DVUIConstants.colors.loginPeach.CGColor
        self.layer.cornerRadius = 10
        
        configureFields()
        configureImageViews()
        
        let viewsDict = [
            "tf"    :   textField,
            "img"   :   errorImg
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[tf]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-2-[img]-2-|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[tf]-10-[img(==40)]|", views: viewsDict))
        
    }
    
    convenience init(placeholder : String) {
        self.init(frame: CGRect.zero)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        configureViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}