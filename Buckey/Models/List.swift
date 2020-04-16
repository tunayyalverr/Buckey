//
//  List.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import RealmSwift

class List: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func create(title: String) -> List {
        let list = List()
        list.title = title
        
        return list
    }
    
}


extension List {
    
    func write() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self)
            print(Realm.Configuration.defaultConfiguration.fileURL!)
        }
    }
    
    func read() -> [List] {
        let realm = try! Realm()
        let data = realm.objects(List.self)
        return data.reversed()
    }
    
    func delete() {
        checkNotes()
        let realm = try! Realm()
        try! realm.write {
            realm.delete(self)
        }
    }
    
    //MARK: - For Notes
    func checkNotes() {
        var notes = [Note]()
        notes = Note().read()
        notes = notes.filter{ ($0.listId?.elementsEqual(self.id) ?? false) }
        guard notes.count != 0 else { return }
        for note in notes {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(note)
            }
        }
    }
    
}
