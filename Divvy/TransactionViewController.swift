//
//  TransactionViewController.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class TransactionViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var totaltransPageView = TotalTransactionView(frame: CGRect.zero)
    var navBarView = NavBarView(frame: CGRect.zero)
    
    func configureView() {
        self.view.backgroundColor = DVUIConstants.colors.darkGrayBackground
        
        configureButtons()
        configureLabels()
        
        let viewsDict = [
            "navbar"    :   navBarView,
            "finalBar"  :   totaltransPageView
        ]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:[finalBar(==100)]|", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[finalBar]|", views: viewsDict))

    }
    
    func configureLabels() {
        print("@sahaj, @nishad")
        //math stuff
        //let user = Model.sharedInstance.currUser
        //self.transPageView.youPay.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func configureButtons() {
        self.totaltransPageView.completeTrans.addTarget(self, action: #selector(backToHomePage), forControlEvents: .TouchUpInside)
    }
    
    func backToHomePage() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}