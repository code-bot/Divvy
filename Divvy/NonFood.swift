//
//  NonFood.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class NonFood: Item {
    var personal: Bool!
    
    init(personal: Bool) {
        super.init(itemName: itemName, price: price)
        self.personal = personal
    }
}