//
//  HomeTableViewCell.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/25/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewcell: UIView {
    
    var date = UILabel()
    var youPay = UILabel()
    var total = UILabel()
    
    func configureLabels() {
        youPay.text = "Amount Due: $"
        youPay.textColor = UIColor.whiteColor()
        youPay.textAlignment = .Center
        youPay.font.fontWithSize(24.0)
        date.text = "Date: "
        date.textColor = UIColor.whiteColor()
        date.textAlignment = .Center
        date.font.fontWithSize(14.0)
        total.text = "Total: $"
        total.textColor = UIColor.whiteColor()
        total.textAlignment = .Center
        total.font.fontWithSize(14.0)
    }
    
    func configureView() {
        
        configureLabels()
        
        let viewsDict   =   [
            "youPay"    :   youPay,
            "date"      :   date,
            "tot"       :   total
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[youPay]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[date][tot]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[date]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[tot]", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[youPay(==\(String(DVUIConstants.screenWidth * 0.4)))]|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}