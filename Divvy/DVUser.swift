//
//  DVUser.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin
import UIKit

class DVUser {
    var email : String!
    var pass  : String!
    var fName : String!
    var lName : String!
    var photo : UIImage!
    var vegPref : Bool!
    var foodPref = [Item]()
    var remainingTransactions = [(Transaction)]()
    
    init(email: String) {
        self.email = email
    }
    
    init(email: String, pass: String) {
        self.email = email
        self.pass = pass
    }
    
    func addToFoodPref(_ item: Item) {
        foodPref.append(item)
    }
}
