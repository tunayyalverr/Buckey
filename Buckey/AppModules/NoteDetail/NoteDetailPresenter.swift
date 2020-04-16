//
//  NoteDetailPresenter.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class NoteDetailPresenter: NoteDetailViewToPresenterProtocol {
    
    var view: NoteDetailPresenterToViewProtocol!
    var router: NoteDetailPresenterToRouterProtocol!
    
    var note: Note!
    var list: List!
    
    func editTapped(delegate: AddNoteDialogDelegate) {
        router.gotoEditNote(delegate: delegate, list: list, note: note)
    }
    
}
