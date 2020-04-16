//
//  ListPresenter.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import RealmSwift

class ListPresenter: ListViewToPresenterProtocol {
    
    var view: ListPresenterToViewProtocol!
    var router: ListPresenterToRouterProtocol!
    
    var lists: [List]?
    
    func addTapped(delegate: AddListDialogDelegate) {
        router.gotoAdd(delegate: delegate)
    }
    
    func getLists() {
        lists = List().read()
        self.view.didGetList()
    }
    
    func listTapped(list: List) {
        router.gotoNotes(list: list)
    }
    
    func listAdded(_ list: List) {
        self.lists?.insert(list, at: 0)
        self.view.didGetList()
    }
    
    func deleteList(index: Int) {
        lists?[index].delete()
        lists?.remove(at: index)
        view.didDeleteList(index: index)
    }
    
}
