//
//  HomeTableViewCell.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/25/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var date = UILabel()
    var youPay = UILabel()
    var total = UILabel()
    
    func configureLabels() {
        youPay.text = "Amount Due: $"
        youPay.textColor = UIColor.white
        youPay.textAlignment = .center
        youPay.font.withSize(24.0)
        date.text = "Date: "
        date.textColor = UIColor.white
        date.textAlignment = .center
        date.font.withSize(14.0)
        total.text = "Total: $"
        total.textColor = UIColor.white
        total.textAlignment = .center
        total.font.withSize(14.0)
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
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[youPay(==\(String(describing: DVUIConstants.screenWidth * 0.4)))]|", views: viewsDict))
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
