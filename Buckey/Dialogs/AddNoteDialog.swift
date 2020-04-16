//
//  AddNoteDialog.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol AddNoteDialogDelegate {
    func didAddNote(_ note: Note)
}

class AddNoteDialog: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var titleLabel: AppLabel!
    @IBOutlet private weak var titleTextfield: AppTextfield!
    @IBOutlet private weak var noteTextview: BaseTextView!
    @IBOutlet private weak var noteTextviewHeight: NSLayoutConstraint!
    @IBOutlet private weak var saveButton: AppButton!
    
    //MARK: - Properties
    var delegate: AddNoteDialogDelegate!
    var list: List!
    var note: Note?
    
    enum Style {
        case add
        case edit
    }
    var style: Style!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience init(delegate: AddNoteDialogDelegate, list: List, note: Note?, style: Style) {
        self.init(nibName: "AddNoteDialog", bundle: Bundle.main)
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        
        self.delegate = delegate
        self.list = list
        self.note = note
        self.style = style
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        prepareView()
        checkNote()
    }
    
    func prepareView() {
        titleLabel.style = .tertiary
        titleLabel.text = Strings.addNoteDialogTitle
        
        titleTextfield.placeholderText = Strings.addNoteDialogTitlePlaceholder
        
        noteTextview.placeholderText = Strings.addNoteDialogSubtitlePlaceholder
        noteTextview.baseTextviewDelegate = self
        
        saveButton.style = .save
    }
    
    func checkNote() {
        guard note != nil else { return }
        titleTextfield.text = note?.title
        noteTextview.text = note?.detail
        noteTextview.placeholderLabel.isHidden = true
        self.adjustTextViewHeight()
    }

    //MARK: - Actions
    @IBAction func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped() {
        guard titleTextfield.text != nil else {
            showEmptyError(fieldName: Strings.addListDialogPlaceholder)
            return
        }
        
        guard noteTextview.text != nil else {
            showEmptyError(fieldName: Strings.addListDialogPlaceholder)
            return
        }
        
        switch style! {
        case .add:
            save()
        case .edit:
            edit()
        }
    }
    
    func save() {
        let note = Note.create(listId: self.list.id, title: titleTextfield.text!, detail: noteTextview.text!)
        note.write()
        self.delegate.didAddNote(note)
        self.dismiss(animated: true, completion: nil)
    }
    
    func edit() {
        let note = Note.create(listId: self.list.id, title: titleTextfield.text!, detail: noteTextview.text!)
        note.update(list: self.list, newNote: note)
        self.delegate.didAddNote(note)
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - NoteTextview Delegate
extension AddNoteDialog: BaseTextViewDelegate {
    func shouldAdjustHeight() {
        UIView.animate(withDuration: 0.2) {
            self.adjustTextViewHeight()
        }
    }
    
    func adjustTextViewHeight() {
        let fixedWidth = noteTextview.frame.size.width
        let newSize = noteTextview.sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        self.noteTextviewHeight?.constant = newSize.height
        self.noteTextview.isScrollEnabled = false
        self.view.layoutIfNeeded()
    }
}
