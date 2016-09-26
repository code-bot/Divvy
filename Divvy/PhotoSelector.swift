//
//  PhotoSelector.swift
//  Campus Crave
//
//  Created by Sahaj Bhatt on 9/6/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class PhotoSelector: UIView {
    
    //Image View
    var selectedImg = UIImageView()
    let imagePicker = UIImagePickerController()
    
    func configureImageView() {
        selectedImg.image = DVUIConstants.noPhoto
        selectedImg.contentMode = .scaleToFill
        selectedImg.layer.borderColor = UIColor.white.cgColor
        selectedImg.layer.borderWidth = 2
    }
    
    func configureView() {
        
        configureImageView()
        
        let viewsDict = [
            "img"   :   selectedImg
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[img(==\(String(describing: DVUIConstants.photoSize)))]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[img(==\(String(describing: DVUIConstants.photoSize)))]|", views: viewsDict))
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
