//
//  UILabel+Extensions.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(fontName: String, size: CGFloat, color: UIColor = UIColor.white) {
        self.init()
        self.font = UIFont(name: fontName, size: size)
        self.textColor = color
    }
    
    convenience init(font: UIFont?, color: UIColor = UIColor.white) {
        self.init()
        self.font = font
        self.textColor = color
    }
}
