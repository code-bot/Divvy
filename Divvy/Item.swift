//
//  Item.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class Item {
    var itemName = String
    var price = Double
    
    init (itemName: String, price: Double) {
        self.itemName = itemName
        self.price = price
    }
}