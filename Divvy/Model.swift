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
    
    init() {
        dbRef = FIRDatabase.database().reference()
        //default data
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