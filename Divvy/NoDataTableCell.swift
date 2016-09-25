//
//  NoDataTableCell.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/25/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class NoDataTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var noInfoLabel = UILabel()
        noInfoLabel.text = "You have payed all of your transactions!"
        noInfoLabel.textColor = UIColor.lightGrayColor()
        
        self.backgroundColor = UIColor.darkGrayColor()
        
        let viewsDict = [
            "lbl"   : noInfoLabel
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[lbl]|", views: viewsDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}