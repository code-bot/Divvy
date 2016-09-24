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
    let licenseCode = "015B4210-1C16-4485-868B-D8EFFE7D1A61"
    let username = "sahajbot"
    
    init() {
        dbRef = FIRDatabase.database().reference()
        items = [Item]()
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