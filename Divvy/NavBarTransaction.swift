//
//  NavBarTransaction.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/25/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class NavBarTransaction: UIView, UITextViewDelegate {
    //ImageViews
    var titleLogoView = UIImageView()
    
    //Image
    var photo = DVUIConstants.noPhoto

    
    //Buttons
    var back = UIButton()
    
    //Views
    var photoSel = PhotoSelector()
    
    
    func configureImageViews() {
        titleLogoView.image = DVUIConstants.logoImg
        titleLogoView.contentMode = .scaleAspectFit
    }
    
    func configureButtons() {
        back.setImage(DVUIConstants.peachBack, for: UIControlState())
        back.imageView?.contentMode = .scaleAspectFit
        back.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
        back.backgroundColor = UIColor.clear
    }
    
    func configureViews() {
        
        
    }
    func configureView() {
        self.backgroundColor = UIColor.clear
        
        configureButtons()
        configureImageViews()
        
        let viewsDict = [
            
            "back"      :   back,
            "logo"      :   titleLogoView,
            
            ] as [String : UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-5-[logo]-5-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-25-[logo]-25-|", views: viewsDict))
        
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-25-[back(==\(String(describing: DVUIConstants.signOutHeight)))]-15-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[back]", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
