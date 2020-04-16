//
//  AppLabel.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AppLabel: UILabel {
    
    enum Style {
        case primary
        case secondary
        case tertiary
        
        case custom(font: UIFont, color: UIColor)
    }
    
    var style: Style? {
        didSet {
            setFont()
            setColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setFont()
        setColor()
    }
    
    private func setFont() {
        font = style?.font
    }
    
    private func setColor() {
        textColor = style?.textColor
    }
    
}


extension AppLabel.Style {
    
    var font: UIFont {
        switch self {
        case .primary:
            return .font(.bold, size: .primary)
        case .secondary:
            return .font(.regular, size: .primary)
        case .tertiary:
            return .font(.bold, size: .primary)
        case .custom(let font, _):
            return font
        }
    }
    
    
    var textColor: UIColor {
        switch self {
        case .primary:
            return .textPrimary
        case .secondary:
            return .textSecondary
        case .tertiary:
            return .textTertiary
        case .custom(_, let textColor):
            return textColor
        }
    }
    
}
