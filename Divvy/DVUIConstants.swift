//
//  DVConstants.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit

struct DVUIConstants {
    static let viewFactor           = UIScreen.mainScreen().bounds.size.width / 375
    static let animationDuration    = 0.25
    
    //Screensize
    static let screenSize           = UIScreen.mainScreen().bounds.size
    static let screenWidth          = screenSize.width
    static let screenHeight         = screenSize.height
    
    //Title/Login Page
    static let loginHubWidth = (7 * screenWidth)/8
    static let loginHubCenterWidthOffset = screenWidth/2 - loginHubWidth/2
    static let loginHubHeight = CGFloat(350)
    static let loginHubCenterHeightOffset = logoImgViewHeight + logoHeightOffset + screenWidth/9
    static let logoImg = UIImage(named: "TestLogo")
    static let logoImgViewHeight = screenHeight/3 - logoHeightOffset
    static let logoHeightOffset = screenHeight/12
    static let loginBtnsHeight = CGFloat(40)
    static let loginBtnsOffset = CGFloat(5)
    
    //Login/SignUp Text Fields and Checkboxes
    static let textFieldWidth = (5 * screenWidth)/6
    static let textFieldCenterWidthOffset = screenWidth/2 - textFieldWidth/2
    static let textFieldHeight = CGFloat(40)
    static let greenCheckmark = UIImage(named: "GreenCheckmarkFilled")
    static let redX = UIImage(named: "RedXFilled")
    static let peachBack = UIImage(named: "PeachBackArrow")
    static let checkedBox = UIImage(named: "CheckedBox")
    static let emptyBox = UIImage(named: "EmptyBox")
    static let noPhoto = UIImage(named: "NoProfilePhoto")
    static let photoSize = screenHeight/5
    static let photoSelOffset = screenWidth/2 - photoSize/2
    
    //Home page
    static let homeWidth = (7 * screenWidth)/8
    static let homeCenterWidthOffset = screenWidth/2 - loginHubWidth/2
    static let homeHeight = CGFloat(350)
    static let homeCenterHeightOffset = logoImgViewHeight + logoHeightOffset + screenWidth/9
    static let navBarHeight = CGFloat(40)
    static let tabBtnHeight = CGFloat(40)
    static let signOut = UIImage(named: "SignOut")
    static let signOutWidth = 20
    static let titleFontSize = CGFloat(36.0)
    static let infoFontSize = CGFloat(20.0)
    static let cameraHeight = CGFloat(40)
    static let cameraOffset = CGFloat(5)
    
    
    struct colors {
        // example colors
        
        //Title/Login Page
        static let darkLoginGradientDark    = UIColor(r: 30, g: 30, b: 30, a: 1.0)
        static let darkLoginGradientLight   = UIColor(r: 89, g: 89, b: 89, a: 1.0)
        static let loginPeach                = UIColor(r: 255, g: 153, b: 153, a: 1.0)
        
        static let darkGrayBackground       = UIColor(r: 30, g: 30, b: 30, a: 1.0)
        
    }
    
    struct fonts {
        
    }
}
