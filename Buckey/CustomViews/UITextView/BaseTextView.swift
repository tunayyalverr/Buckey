//
//  BaseTextView.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol BaseTextViewDelegate {
    func shouldAdjustHeight()
}

class BaseTextView: UITextView {
    
    var baseTextviewDelegate: BaseTextViewDelegate?
    var placeholderLabel: AppLabel!
    var placeholderText: String? {
        didSet {
            placeholderLabel.text = placeholderText
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        delegate = self
        self.layer.cornerRadius = 20
        self.backgroundColor = .backgroundSecondary
        
        addPlaceholderLabel()
    }
    
    func addPlaceholderLabel() {
        placeholderLabel = AppLabel(frame: CGRect(x: 20, y: 15, width: self.frame.width, height: 20))
        placeholderLabel.textColor = .textSecondary
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = true
        placeholderLabel.textAlignment = .left
        placeholderLabel.font = .font(.bold, size: .primary)
        self.tintColor = .textPrimary
        self.textColor = .textPrimary
        self.font = .font(.regular, size: .primary)
        textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 15)
        self.addSubview(placeholderLabel)
    }
        
}

//MARK: - TextViewDelegate
extension BaseTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let rawLineNumber = (textView.contentSize.height - textView.textContainerInset.top - textView.textContainerInset.bottom) / textView.font!.lineHeight
        let finalLineNumber = round(rawLineNumber)
        if finalLineNumber < 5 {
            self.baseTextviewDelegate?.shouldAdjustHeight()
        }else {
            self.self.isScrollEnabled = true
        }
        
        if textView.text.count == 0 {
            placeholderLabel.isHidden = false
        }else {
            placeholderLabel.isHidden = true
        }
    }
}
