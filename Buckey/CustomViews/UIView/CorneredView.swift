//
//  CorneredView.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class CorneredView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepare()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        prepare()
    }
    
    
    func prepare() {
        self.backgroundColor = .backgroundPrimary
        self.layer.cornerRadius = 22
    }
    
}
