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
    var navBarTransaction = NavBarTransaction(frame: CGRect.zero)
    
    
    func backButton(_ sender: AnyObject!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func editProfileButton(_ sender: AnyObject!) {
        self.present(EditProfileViewController(), animated: true, completion: nil)
    }
    
    func configureView() {
        self.view.backgroundColor = DVUIConstants.colors.darkGrayBackground
        
        configureButtons()
        configureLabels()
        
        let viewsDict = [
            "navbar"    :   navBarTransaction,
            "finalBar"  :   totaltransPageView
        ] as [String : UIView]
        
        self.view.prepareViewsForAutoLayout(viewsDict)
        
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-20-[navbar]", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[navbar]|", views: viewsDict))
        
        
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:[finalBar(==100)]|", views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[finalBar]|", views: viewsDict))
        
    }
    
    func configureLabels() {
        print("@sahaj, @nishad")
        //math stuff
        //let user = Model.sharedInstance.currUser
        //self.transPageView.youPay.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func configureButtons() {
        self.totaltransPageView.completeTrans.addTarget(self, action: #selector(backToHomePage), for: .touchUpInside)
        self.navBarTransaction.back.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    
    func backToHomePage() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}
