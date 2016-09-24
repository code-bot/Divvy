//
//  TransactionViewController.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit

class TransactionViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var transPageView = TransactionView(frame: CGRect(x: DVUIConstants.homeCenterWidthOffset, y: DVUIConstants.homeCenterHeightOffset, width: DVUIConstants.homeWidth, height: DVUIConstants.homeHeight))
    
    func configureView() {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [DVUIConstants.colors.darkLoginGradientDark.CGColor, DVUIConstants.colors.darkLoginGradientLight.CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        configureButtons()
        configureLabels()
        
        self.view.addSubview(transPageView)
    }
    
    func configureLabels() {
        //let user = Model.sharedInstance.currUser
        
        //self.transPageView.youPay.
    }
    
    func configureButtons() {
        self.transPageView.completeTrans.addTarget(self, action: #selector(backToHomePage), forControlEvents: .TouchUpInside)
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