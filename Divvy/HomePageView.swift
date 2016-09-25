//
//  HomePageView.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit


class HomePageView: UIView, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    //Buttons
    var camera = UIButton()
    
    //Table
    var tableView = UITableView()
    
    func configureButtons() {
        camera.setTitle("Camera", forState: .Normal)
        camera.backgroundColor = DVUIConstants.colors.loginPeach
        camera.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        
        tableView.registerClass(HomeTableViewCell.self, forCellReuseIdentifier: "Home")
    }
    

    func configureView() {
        self.backgroundColor = UIColor.clearColor()
        
        Model.sharedInstance.addTransactions()
        
        configureButtons()
        configureTable()
        
        
        let viewsDict = [
            "table" :   tableView,
            "camera":   camera,
            
            ]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[table][camera(==50)]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[camera]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[table]|", views: viewsDict))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.sharedInstance.items.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Home") as! HomeTableViewCell
        
        cell.date = Model.sharedInstance.currUser?.remainingTransactions[indexPath.row].date
        cell.youPay = Model.sharedInstance.currUser?.remainingTransactions[indexPath.row].userTotal
        cell.total = Model.sharedInstance.currUser?.remainingTransactions[indexPath.row].groupTotal
        return cell!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
