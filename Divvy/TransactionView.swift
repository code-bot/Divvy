//
//  TransactionView.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class TransactionView: UIView, UITextViewDelegate {
    
    var completeTrans = UIButton()
    var youPay = UILabel()
    var youSave = UILabel()
    var total = UILabel()
    
    func configureButtons() {
        completeTrans.setTitle("Finish", forState: .Normal)
        completeTrans.backgroundColor = DVUIConstants.colors.loginPeach
        completeTrans.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        completeTrans.layer.cornerRadius = 20
    }
    
    func configureLabels() {
        youPay.text = "You Pay: $"
        youPay.textColor = DVUIConstants.colors.loginPeach
        youPay.textAlignment = .Center
        youSave.text = "You Save: $"
        youSave.textColor = DVUIConstants.colors.loginPeach
        youSave.textAlignment = .Center
        total.text = "Total: $"
        total.textColor = DVUIConstants.colors.loginPeach
        total.textAlignment = .Center
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
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-100-[youPay]-35-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[youPay]-100-|", views: viewsDict))
    
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-115-[youSave]-25-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[youSave]-100-|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-130-[tot]-5-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[tot]-100-|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-100-[fin]-5-|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-100-[tot]-10-|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
