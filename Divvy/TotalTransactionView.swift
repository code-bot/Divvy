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
        completeTrans.setTitle("Finish", for: UIControlState())
        completeTrans.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 46)
        completeTrans.setTitleColor(DVUIConstants.colors.loginPeach, for: UIControlState())
        completeTrans.backgroundColor = UIColor.clear
    }
    
    func configureLabels() {
        youPay.text = "You Pay: $"
        youPay.textColor = UIColor.white
        youPay.textAlignment = .center
        youPay.font.withSize(20.0)
        youSave.text = "You Save: $"
        youSave.textColor = UIColor.white
        youSave.textAlignment = .center
        youSave.font.withSize(20.0)
        total.text = "Total: $"
        total.textColor = UIColor.white
        total.textAlignment = .center
        total.font.withSize(20.0)
    }
    
    func configureView() {
        configureButtons()
        configureLabels()
        
        let viewsDict = [
            "fin": completeTrans,
            "youPay": youPay,
            "youSave": youSave,
            "tot": total
        ] as [String : UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[fin]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-10-[youPay]-10-[youSave]-10-[tot]", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[youPay]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[youSave]", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-10-[tot]", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:[fin(==\(String(describing: DVUIConstants.screenWidth * 0.4)))]|", views: viewsDict))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
