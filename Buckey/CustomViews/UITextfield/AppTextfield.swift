//
//  AppTextfield.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AppTextfield: UITextField {
    
    //MARK: - Visiual
    @IBInspectable var defaultPadding: CGFloat = 20
    @IBInspectable var defaultTextPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    @IBInspectable var cornerRadius: CGFloat = 22.0
    var placeholderText: String? {
        didSet {
            self.placeholder = placeholderText
            setPlaceholderFont()
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepare()
    }
    
    
    
    //MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func prepare() {
        updateView()
    }
    
    //MARK: - Functions
    private func updateView() {
        //Font
        setTextFont()
        
        //Corner Radius
        borderStyle = .none
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
    
    //MARK: - Fonts
    func setTextFont() {
        self.font = .font(.bold, size: .primary)
        self.textColor = .textPrimary
        self.backgroundColor = .backgroundSecondary
        self.tintColor = .textPrimary
    }
    
    func setPlaceholderFont() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.textSecondary,
            NSAttributedString.Key.font : UIFont.font(.bold, size: .primary)
        ]
        if let placeholder = placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
    
    //MARK: - Text Rect
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: defaultTextPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: defaultTextPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: defaultTextPadding)
    }
    
}
