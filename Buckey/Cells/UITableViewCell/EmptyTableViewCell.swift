//
//  EmptyTableViewCell.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class EmptyTableViewCell: BaseTableViewCell {
    
    @IBOutlet private weak var cellImageView: BaseImageView!
    @IBOutlet private weak var titleLabel: AppLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepare()
    }
    
    func prepare() {
        titleLabel.style = .primary
        titleLabel.text = Strings.emptyList
    }
    
    

}
