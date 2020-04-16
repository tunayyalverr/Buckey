//
//  NotesRouter.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class NotesRouter: NotesPresenterToRouterProtocol {
    
    var view: NotesViewController!
    
    class func createNotesModule(list: List) -> NotesViewController {
        let view: NotesViewController = storyboard.instantiateViewController()
        let presenter: NotesViewToPresenterProtocol = NotesPresenter()
        let router: NotesPresenterToRouterProtocol = NotesRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.list = list
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Notes", bundle: Bundle.main)
    }
    
    func gotoAdd(delegate: AddNoteDialogDelegate, list: List) {
        view.showAddNoteDialog(delegate: delegate, list: list)
    }
    
    func gotoNotesDetail(note: Note, list: List, delegate: NotesDetailViewControllerDelegate) {
        let noteDetail = NoteDetailRouter.createNoteDetailModule(note: note, list: list, delegate: delegate)
        self.view.navigationController?.pushViewController(noteDetail, animated: true)
    }

}
