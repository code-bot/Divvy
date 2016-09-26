//
//  TransactionTableViewCell.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/25/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class TransactionTableViewCell: UIView {
    var item = UILabel()
    var price = UILabel()
    //var users = [UIImage()]
    
    func configureLabels() {
        item.text = "ItemName"
        item.textColor = UIColor.white
        item.textAlignment = .center
        item.font.withSize(24.0)
        price.text = "Price"
        price.textColor = UIColor.white
        price.textAlignment = .center
        price.font.withSize(14.0)
    }
    
    func configureView() {
        
        configureLabels()
        
        let viewsDict   =   [
            "item"      :   item,
            "price"     :   price
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-5-[item]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-5-[price]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[item]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[price]-10-|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
