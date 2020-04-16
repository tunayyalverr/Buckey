//
//  BaseNavigationController.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
    }
    
    func prepare() {
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = .backgroundPrimary
        navigationBar.backgroundColor = .backgroundPrimary
        navigationBar.tintColor = .textTertiary
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.textTertiary,
                                             NSAttributedString.Key.font : UIFont.font(.bold, size: .primary)]
    }

}
