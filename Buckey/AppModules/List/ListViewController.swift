//
//  ListViewController.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: BaseTableView!
    
    // MARK: - Properties
    var presenter: ListViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
        addNavigationBarButtons()
        presenter.getLists()
    }
    
    //MARK: - Functions
    func prepare() {
        self.navigationItem.title = Strings.listTitle
        tableView.register(ListTableViewCell.self)
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

// MARK: - ListPresenterOutputDelegate
extension ListViewController: ListPresenterToViewProtocol {
    func didGetList() {
        self.tableView.reloadData()
    }
    
    func didDeleteList(index: Int) {
//        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        self.tableView.reloadData()
    }
}

//MARK: - Add List Delegate
extension ListViewController: AddListDialogDelegate {
    func didAddList(_ list: List) {
        presenter.listAdded(list)
    }
}

//MARK: - TableView DataSource + Delegate
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.lists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListTableViewCell = tableView.dequeueReusableCell()
        cell.list = presenter.lists?[indexPath.row]
        return cell
    }
    
    //MARK: - Did Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let list = presenter.lists?[indexPath.row] else { return }
        presenter.listTapped(list: list)
    }
    
    //MARK: - Swipe
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Sil" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            self.presenter.deleteList(index: indexPath.row)
          })
          return [delete]
    }
    
}

