//
//  UIColor+Extensions.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: Float) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a))
    }
}
