//
//  NoteDetailRouter.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class NoteDetailRouter: NoteDetailPresenterToRouterProtocol {
    
    var view: NoteDetailViewController!
    
    class func createNoteDetailModule(note: Note, list: List, delegate: NotesDetailViewControllerDelegate) -> NoteDetailViewController {
        let view: NoteDetailViewController = storyboard.instantiateViewController()
        let presenter: NoteDetailViewToPresenterProtocol = NoteDetailPresenter()
        let router: NoteDetailPresenterToRouterProtocol = NoteDetailRouter()
        
        view.presenter = presenter
        view.delegate = delegate
        
        presenter.view = view
        presenter.router = router
        presenter.note = note
        presenter.list = list
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "NoteDetail", bundle: Bundle.main)
    }

    func gotoEditNote(delegate: AddNoteDialogDelegate, list: List, note: Note) {
        view.showEditNoteDialog(delegate: delegate, list: list, note: note)
    }
    
}
