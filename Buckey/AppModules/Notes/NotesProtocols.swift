//
//  NotesProtocols.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol NotesViewToPresenterProtocol: class {
    
    var view: NotesPresenterToViewProtocol! { get set }
    var router: NotesPresenterToRouterProtocol! { get set }
    
    var list: List! { get set }
    var notes: [Note]? { get set }
    
    func getNotes()
    func addTapped(delegate: AddNoteDialogDelegate)
    func noteAdded(_ note: Note)
    func deleteNote(index: Int)
    func noteTapped(_ note: Note, delegate: NotesDetailViewControllerDelegate)
    
}

protocol NotesPresenterToViewProtocol: class {
    
    func didGetNotes()
    func didDeleteNote(index: Int)
    
}

protocol NotesPresenterToRouterProtocol: class {
    
    var view: NotesViewController! { get set }
    
    func gotoAdd(delegate: AddNoteDialogDelegate, list: List)
    func gotoNotesDetail(note: Note, list: List, delegate: NotesDetailViewControllerDelegate)
    
}
