//
//  NotesPresenter.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class NotesPresenter: NotesViewToPresenterProtocol {
    
    var view: NotesPresenterToViewProtocol!
    var router: NotesPresenterToRouterProtocol!
    
    var list: List!
    var notes: [Note]?
    
    func getNotes() {
        notes = Note().read()
        notes = notes?.filter{ ($0.listId?.elementsEqual(list.id) ?? false) }
        self.view.didGetNotes()
    }
    
    func addTapped(delegate: AddNoteDialogDelegate) {
        router.gotoAdd(delegate: delegate, list: list)
    }
    
    func noteAdded(_ note: Note) {
        notes?.insert(note, at: 0)
        self.view.didGetNotes()
    }
    
    func deleteNote(index: Int) {
        notes?[index].delete()
        notes?.remove(at: index)
        view.didDeleteNote(index: index)
    }
    
    func noteTapped(_ note: Note, delegate: NotesDetailViewControllerDelegate) {
        router.gotoNotesDetail(note: note, list: self.list, delegate: delegate)
    }
    
}
