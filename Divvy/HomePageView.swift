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
        camera.setTitle("Camera", for: UIControlState())
        camera.backgroundColor = DVUIConstants.colors.loginPeach
        camera.setTitleColor(UIColor.white, for: UIControlState())
    }
    
    func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "Home")
    }
    

    func configureView() {
        self.backgroundColor = UIColor.clear
        
        Model.sharedInstance.addTransactions()
        
        configureButtons()
        configureTable()
        
        
        let viewsDict = [
            "table" :   tableView,
            "camera":   camera,
            
            ] as [String : UIView]
        
        self.prepareViewsForAutoLayout(viewsDict)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|[table][camera(==50)]|", views: viewsDict))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[camera]|", views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[table]|", views: viewsDict))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.sharedInstance.items.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home") as! HomeTableViewCell
        cell.date.text = Model.sharedInstance.currUser?.remainingTransactions[indexPath.row].date
        cell.youPay.text = String(describing: Model.sharedInstance.currUser?.remainingTransactions[indexPath.row].userTotal)
        cell.total.text = String(describing: Model.sharedInstance.currUser?.remainingTransactions[indexPath.row].groupTotal)
        return cell
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
