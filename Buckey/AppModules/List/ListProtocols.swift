//
//  ListProtocols.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol ListViewToPresenterProtocol: class {
    
    var view: ListPresenterToViewProtocol! { get set }
    var router: ListPresenterToRouterProtocol! { get set }
    
    var lists: [List]? { get set }
    
    func getLists()
    func addTapped(delegate: AddListDialogDelegate)
    func listAdded(_ list: List)
    func deleteList(index: Int)
    func listTapped(list: List)
    
}

protocol ListPresenterToViewProtocol: class {
    
    func didGetList()
    func didDeleteList(index: Int)
    
}

protocol ListPresenterToRouterProtocol: class {
    
    var view: ListViewController! { get set }
    
    func gotoAdd(delegate: AddListDialogDelegate)
    func gotoNotes(list: List)
    
}
