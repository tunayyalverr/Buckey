//
//  NotesViewController.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: BaseTableView!
    
    // MARK: - Properties
    var presenter: NotesViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavigationBarButtons()
        prepare()
        presenter.getNotes()
    }
    
    //MARK: - Functions
    func prepare() {
        self.navigationItem.title = presenter.list.title
        tableView.register(NoteTableViewCell.self)
    }
    
    func addNavigationBarButtons() {
        let addButton = UIBarButtonItem(image: UIImage(named: "ic_plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    //MARK: - Actions
    @objc func addButtonTapped() {
        presenter.addTapped(delegate: self)
    }
    
}

// MARK: - NotesPresenterOutputDelegate
extension NotesViewController: NotesPresenterToViewProtocol {
    func didGetNotes() {
        self.tableView.reloadData()
    }
    
    func didDeleteNote(index: Int) {
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
    }
}

// MARK: - AddNote Delegate
extension NotesViewController: AddNoteDialogDelegate {
    func didAddNote(_ note: Note) {
        presenter.noteAdded(note)
    }
}

//MARK: - NoteDetail Delegate
extension NotesViewController: NotesDetailViewControllerDelegate {
    func didNoteUpdate() {
        presenter.getNotes()
    }
}

//MARK: - TableView DataSource + Delegate
extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteTableViewCell = tableView.dequeueReusableCell()
        cell.note = presenter.notes?[indexPath.row]
        return cell
    }
    
    //MARK: - Did Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let note = presenter.notes?[indexPath.row] else { return }
        presenter.noteTapped(note, delegate: self)
    }
    
}
