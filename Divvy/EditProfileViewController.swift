//
//  EditProfileViewController.swift
//  Divvy
//
//  Created by Rahul Nambiar on 9/24/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var editDetailsView = EditProfileDetailsView(frame: CGRect.zero)
    
    func configureLabels() {
        
    }
    
    func configureButtons() {
        
    }
    
    func configureView() {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}