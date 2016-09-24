//
//  DVBaseViewController.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit

class CDBaseViewController: UIViewController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        self.configureViews()
    }
    
    func configureViews() {}
    
}
