//
//  BaseTableViewCell.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .backgroundPrimary
    }

}
