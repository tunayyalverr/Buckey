//
//  ColorView.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class ColorView: UIView {
    
    @IBInspectable
    var color: UIColor = .appPaletteFirst {
        didSet {
            self.backgroundColor = color
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepare()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        prepare()
    }
    
    
    func prepare() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
}
