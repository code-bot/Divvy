//
//  UIView+Extensions.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit

extension UIView {
    func prepareViewsForAutoLayout(_ viewsDict: [String: UIView]) {
        let _ = Array(viewsDict.values).map({$0.translatesAutoresizingMaskIntoConstraints = false; self.addSubview($0)})
    }
}
