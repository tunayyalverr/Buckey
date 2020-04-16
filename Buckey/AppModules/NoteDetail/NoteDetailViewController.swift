//
//  NoteDetailViewController.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol NotesDetailViewControllerDelegate {
    func didNoteUpdate()
}

class NoteDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: AppLabel!
    @IBOutlet private weak var subtitleLabel: AppLabel!
    
    // MARK: - Properties
    var presenter: NoteDetailViewToPresenterProtocol!
    var delegate: NotesDetailViewControllerDelegate!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
        addNavigationBarButtons()
    }
    
    func prepare() {
        titleLabel.style = .primary
        subtitleLabel.style = .secondary
        titleLabel.text = presenter.note.title
        subtitleLabel.text = presenter.note.detail
    }
    
    func addNavigationBarButtons() {
        let aditButton = UIBarButtonItem(image: UIImage(named: "ic_edit"), style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItems = [aditButton]
    }
    
    //MARK: - Actions
    @objc func editButtonTapped() {
        presenter.editTapped(delegate: self)
    }
    
}

// MARK: - NoteDetailPresenterOutputDelegate
extension NoteDetailViewController: NoteDetailPresenterToViewProtocol {

}

//MARK: - AddDialog Delegate
extension NoteDetailViewController: AddNoteDialogDelegate {
    func didAddNote(_ note: Note) {
        titleLabel.text = note.title
        subtitleLabel.text = note.detail
        delegate.didNoteUpdate()
    }
}
