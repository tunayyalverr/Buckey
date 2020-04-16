//
//  NoteTableViewCell.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class NoteTableViewCell: BaseTableViewCell {
    
    @IBOutlet private weak var colorView: ColorView!
    @IBOutlet private weak var titleLabel: AppLabel!
    @IBOutlet private weak var subtitleLabel: AppLabel!
    @IBOutlet private weak var rightImageView: BaseImageView!
    
    var note: Note! {
        didSet {
            titleLabel.text = note.title
            subtitleLabel.text = note.detail
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepare()
    }
    
    func prepare() {
        titleLabel.style = .primary
        subtitleLabel.style = .secondary
    }
    
}
