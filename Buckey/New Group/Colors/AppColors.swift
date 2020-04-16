//
//  AppColors.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: - Hex
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    //MARK: - App
    static var appPaletteFirst: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "appPaletteFirst")!
        }
        return UIColor(rgb: 0x2196F3)
    }
    
    
    //MARK: - Background
    static var backgroundPrimary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "backgroundPrimary")!
        }
        return UIColor(rgb: 0xFFFFFF)
    }
    
    static var backgroundSecondary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "backgroundSecondary")!
        }
        return UIColor(rgb: 0xF4F4F4)
    }
    
    static var seperatorBackgroundPrimary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "seperatorBackgroundPrimary")!
        }
        return UIColor(rgb: 0xEEEEEE)
    }
    
    //MARK: - Text
    static var textPrimary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "textPrimary")!
        }
        return UIColor(rgb: 0x1C1C1E)
    }
    
    static var textSecondary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "textSecondary")!
        }
        return UIColor(rgb: 0xAAAAAA)
    }
    
    static var textTertiary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "textTertiary")!
        }
        return UIColor(rgb: 0x2196F3)
    }
    
    static var textQuaternary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "textQuaternary")!
        }
        return UIColor(rgb: 0xFFFFFF)
    }
    
    //MARK: - Button
    static var buttonPrimary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "buttonPrimary")!
        }
        return UIColor(rgb: 0x2196F3)
    }
    
}
