//
//  NoteDetailProtocols.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol NoteDetailViewToPresenterProtocol: class {
    
    var view: NoteDetailPresenterToViewProtocol! { get set }
    var router: NoteDetailPresenterToRouterProtocol! { get set }
    
    var note: Note! { get set }
    var list: List! { get set }
    
    func editTapped(delegate: AddNoteDialogDelegate)
    
}

protocol NoteDetailPresenterToViewProtocol: class {
    
}

protocol NoteDetailPresenterToRouterProtocol: class {
    
    var view: NoteDetailViewController! { get set }
    
    func gotoEditNote(delegate: AddNoteDialogDelegate, list: List, note: Note)
    
}
