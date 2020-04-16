//
//  UIFont.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum FontWeight: String {
        case regular    = "SFProRounded-Regular"
        case medium     = "SFProRounded-Medium"
        case bold       = "SFProRounded-Bold"
    }
    
    enum FontSize: CGFloat {
        ///16
        case primary    = 16
    }
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        return UIFont(name: weight.rawValue, size: size.rawValue)!
    }
    
}
