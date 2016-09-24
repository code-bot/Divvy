//
//  DVLogger.swift
//  Divvy
//
//  Created by Karan Lakhani on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

public func CDLog<T>(object: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line, error: Bool = false) {
    let fileString = file as NSString
    let fileLastPathComponent = fileString.lastPathComponent as NSString
    let filename = fileLastPathComponent.stringByDeletingPathExtension
    var str = "\(filename).\(function)[\(line)] "
    let len = 120 - str.characters.count
    str += String(count: len, repeatedValue: Character("-"))
    print(str)
    print("--> \(object)\n\n", terminator: "")
}
