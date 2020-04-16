//
//  BaseViewController.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        prepare()
    }
    
    func prepare() {
        self.view.backgroundColor = .backgroundPrimary
        
        hideKeyboardWhenTappedAround()
        setNavigationBarBackButtonEmpty()
    }

}
