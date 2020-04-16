//
//  ListTableViewCell.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class ListTableViewCell: BaseTableViewCell {
    
    @IBOutlet private weak var titleLabel: AppLabel!
    @IBOutlet private weak var seperatorView: SeperatorView!
    @IBOutlet private weak var rightImageView: BaseImageView!
    
    var list: List! {
        didSet {
            titleLabel.text = list.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepare()
    }

    func prepare() {
        titleLabel.style = .primary
    }
    
}
