//
//  Group.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Group {
    var users : [DVUser]
    var groupPref : [Item]
    
    init(users: [DVUser]) {
        self.users = users
        groupPref = [Item]()
    }
    
    func addToGroupPref(item: Item) {
        groupPref.append(item)
    }
}