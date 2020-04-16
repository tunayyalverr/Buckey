//
//  AddListDialog.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol AddListDialogDelegate {
    func didAddList(_ list: List)
}

class AddListDialog: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var titleLabel: AppLabel!
    @IBOutlet private weak var textfield: AppTextfield!
    @IBOutlet private weak var saveButton: AppButton!
    
    //MARK: - Properties
    var delegate: AddListDialogDelegate!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience init(delegate: AddListDialogDelegate) {
        self.init(nibName: "AddListDialog", bundle: Bundle.main)
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        prepareView()
    }
    
    func prepareView() {
        titleLabel.style = .tertiary
        titleLabel.text = Strings.addListDialogTitle
        
        textfield.placeholderText = Strings.addListDialogPlaceholder
        
        saveButton.style = .save
    }

    //MARK: - Actions
    @IBAction func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped() {
        if textfield.text == nil || textfield.text == "" {
            showEmptyError(fieldName: Strings.addListDialogPlaceholder)
        }else {
            let list = List.create(title: textfield.text!)
            list.write()
            self.delegate.didAddList(list)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
