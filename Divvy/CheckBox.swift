//
//  CheckBox.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 9/6/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIView {
    
    //Button
    var box = UIButton()
    
    //Label
    var label = UILabel()
    
    var isChecked = false {
        didSet{
            if isChecked {
                self.box.setImage(DVUIConstants.checkedBox, forState: .Normal)
            } else {
                self.box.setImage(DVUIConstants.emptyBox, forState: .Normal)
            }
        }
    }
    
    func configureBtn() {
        box.imageView?.contentMode = .ScaleAspectFit
        box.setImage(DVUIConstants.emptyBox, forState: .Normal)
        box.userInteractionEnabled = false
    }
    
    func configureLbl() {
        label.font = UIFont.systemFontOfSize(16.0)
    }
    
    func configureView() {
        
        configureBtn()
        configureLbl()
        
        let viewsDict = [
            "box"   :   box,
            "lbl"   :   label
        ]
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[box]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[lbl]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[box][lbl]", views: viewsDict))
        //self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[lbl]|", views: viewsDict))
    }
    
    func btnClicked() {
        isChecked = !isChecked
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        let checkTap = UITapGestureRecognizer(target: self, action: #selector(btnClicked))
        checkTap.numberOfTapsRequired = 1
        self.addGestureRecognizer(checkTap)
        self.isChecked = false
        
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}