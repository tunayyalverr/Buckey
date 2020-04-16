//
//  BaseButton.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.alpha = 0.5
            }else {
                self.alpha = 1.0
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.alpha = 1.0
            }else {
                self.alpha = 0.5
            }
        }
    }

}
