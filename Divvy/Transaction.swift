//
//  Transaction.swift
//  Divvy
//
//  Created by Sahaj Bhatt on 9/25/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Transaction {
    var userTotal = 0.0
    var groupTotal = 0.0
    var date = ""
    
    init(userTot: Double, groupTot: Double, date: String) {
        userTotal = userTot
        groupTotal = groupTot
        self.date = date
    }
}