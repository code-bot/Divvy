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
        
        //tableView.registerClass(HomeTableViewCell(), forCellReuseIdentifier: "Home")
    }
    

    func configureView() {
        self.backgroundColor = UIColor.clearColor()
        
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
        return 0
        return Model.sharedInstance.items.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("Home")
//        
//        return cell
        return UITableViewCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
