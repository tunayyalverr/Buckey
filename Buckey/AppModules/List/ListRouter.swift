//
//  ListRouter.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class ListRouter: ListPresenterToRouterProtocol {
    
    var view: ListViewController!
    
    class func createListModule() -> ListViewController {
        let view: ListViewController = storyboard.instantiateViewController()
        let presenter: ListViewToPresenterProtocol = ListPresenter()
        let router: ListPresenterToRouterProtocol = ListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "List", bundle: Bundle.main)
    }
    
    func gotoAdd(delegate: AddListDialogDelegate) {
        view.showAddListDialog(delegate: delegate)
    }
    
    func gotoNotes(list: List) {
        let notes = NotesRouter.createNotesModule(list: list)
        self.view.navigationController?.pushViewController(notes, animated: true)
    }

}
