//
//  DVUser.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class DVUser: NSObject {
    var email = String!
    var pass = String!
    var fName = String!
    var lName = String!
    var vegPref = Bool!
    var foodPref = [Item]
    
    override init() {
    }
    
    init(email: String, pass: String, fName: String, lname: String, vegPref: bool) {
        super.init()
        self.email = email
        self.pass = pass
        self.fName = fName
        self.lName = lName
        self.vegPref = vegPref
        foodPref = []
    }
    
    func addToFoodPref(item: Item) {
        foodPref.append(item: Item)
    }
}