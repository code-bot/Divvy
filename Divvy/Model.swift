//
//  Model.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Firebase

class Model {
    
    static let sharedInstance = Model()
    
    var currUser : DVUser?
    var firCurrUser : FIRUser?
    var dbRef : FIRDatabaseReference!
    var items : [Item]
    let licenseCode = "0899F356-6208-4E64-90EB-20797A8BAE07"
    let username = "SHBOT"
    let microsoftAPIKey = "a69307be2f924ed1a98b29863f48d986"
    
    init() {
        dbRef = FIRDatabase.database().reference()
        items = [Item]()
        //default data
    }
    
    func addTransactions() {
        var trans = [Transaction]()
        trans.append(Transaction(userTot: 10.0, groupTot: 20.0, date: "Something"))
        currUser?.remainingTransactions = trans
    }
    
    func loginUser(user: DVUser) {
        currUser = user
    }
    
    func loginFIRUSer(firUser: FIRUser) {
        firCurrUser = firUser
    }
    
    func logoutCurrUser() {
        currUser = nil
        firCurrUser = nil
    }
}