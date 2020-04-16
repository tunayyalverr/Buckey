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
        tableView.register(EmptyTableViewCell.self)
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
        self.tableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if presenter.notes?.count == 0 {
            return tableView.frame.height
        }else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter.notes?.count == 0 {
            return 1
        }else {
            return presenter.notes?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if presenter.notes?.count == 0 {
            let cell: EmptyTableViewCell = tableView.dequeueReusableCell()
            return cell
        }else {
            let cell: NoteTableViewCell = tableView.dequeueReusableCell()
            cell.note = presenter.notes?[indexPath.row]
            return cell
        }
    }
    
    //MARK: - Did Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let note = presenter.notes?[indexPath.row] else { return }
        presenter.noteTapped(note, delegate: self)
    }
    
    //MARK: - Swipe
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: Strings.delete , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            self.presenter.deleteNote(index: indexPath.row)
          })
          return [delete]
    }
    
}
