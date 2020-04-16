//
//  AppButton.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class AppButton: BaseButton {
    
    enum Style {
        case primary
        case save

        case custom(textcolor: UIColor ,backgroundcolor: UIColor)
    }
    
    var style: Style? = .primary {
        didSet {
            setColors()
            setImage()
            setTitle()
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
        self.clipsToBounds = true
        self.layer.cornerRadius = 22
    }
    
    func setColors() {
        backgroundColor = style?.backgroundcolor
        setTitleColor(style?.textcolor, for: .normal)
        tintColor = style?.textcolor
        self.titleLabel?.font = .font(.bold, size: .primary)
    }
    
    func setImage() {
        adjustsImageWhenHighlighted = false
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func setTitle() {
        self.setTitle(style?.title, for: .normal)
    }
    
    
}

extension AppButton.Style {
    
    var textcolor: UIColor! {
        switch self {
        case .primary:
            return .textQuaternary
        case .save:
            return .textQuaternary
        
        case .custom(let textcolor, _):
            return textcolor
        }
    }
    
    var backgroundcolor: UIColor! {
        switch self {
        case .primary:
            return .buttonPrimary
        case .save:
            return .buttonPrimary
        case .custom(_, let backgroundcolor):
            return backgroundcolor
        }
    }
    
    var title: String? {
        switch self {
        case .save:
            return Strings.save
        default:
            return nil
        }
    }
    
}
