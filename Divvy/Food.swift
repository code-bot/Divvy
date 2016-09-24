//
//  Food.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class Food: Item {
    var veg: Bool!
    
    init(itemName: String, price: Double, veg: Bool) {
        super.init(itemName: itemName, price: price)
        self.veg = veg
    }
}