//
//  TotalTransactionView.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class TotalTransactionView: UIView {
    
    var completeTrans = UIButton()
    var youPay = UILabel()
    var youSave = UILabel()
    var total = UILabel()
    
    func configureButtons() {
        completeTrans.setTitle("Finish", forState: .Normal)
        completeTrans.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 46)
        completeTrans.setTitleColor(DVUIConstants.colors.loginPeach, forState: .Normal)
        completeTrans.backgroundColor = UIColor.clearColor()
    }
    
    func configureLabels() {
        youPay.text = "You Pay: $"
        youPay.textColor = UIColor.whiteColor()
        youPay.textAlignment = .Center
        youPay.font.fontWithSize(20.0)
        youSave.text = "You Save: $"
        youSave.textColor = UIColor.whiteColor()
        youSave.textAlignment = .Center
        youSave.font.fontWithSize(20.0)
        total.text = "Total: $"
        total.textColor = UIColor.whiteColor()
        total.textAlignment = .Center
        total.font.fontWithSize(20.0)
    }
    
    func configureView() {
        configureButtons()
        configureLabels()
        
        let viewsDict = [
            "fin": completeTrans,
            "youPay": youPay,
            "youSave": youSave,
            "tot": total
        ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[fin]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-10-[youPay]-10-[youSave]-10-[tot]", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[youPay]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[youSave]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[tot]", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[fin(==\(String(DVUIConstants.screenWidth * 0.4)))]|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
