//
//  HomePageView.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class HomePageView: UIView, UITextViewDelegate {
    
    //Buttons
    var camera = UIButton()
    
    func configureButtons() {
        camera.setTitle("Camera", forState: .Normal)
        camera.backgroundColor = DVUIConstants.colors.loginPeach
        camera.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    

    func configureView() {
        self.backgroundColor = UIColor.clearColor()
        
        configureButtons()
        
        
        let viewsDict = [
            
            "camera":   camera,
            
            ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-40-[camera(==\(String(DVUIConstants.cameraHeight)))]-25-|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-15-[camera]-15-|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
