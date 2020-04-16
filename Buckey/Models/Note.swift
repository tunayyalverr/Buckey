//
//  Note.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import RealmSwift

class Note: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var listId: String? = nil
    @objc dynamic var title: String? = nil
    @objc dynamic var detail: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func create(listId: String, title: String, detail: String?) -> Note {
        let note = Note()
        note.listId = listId
        note.title = title
        note.detail = detail
        
        return note
    }
    
}

extension Note {
    
    func write() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self)
        }
    }
    
    func read() -> [Note] {
        let realm = try! Realm()
        let data = realm.objects(Note.self)
        return data.reversed()
    }
    
    func delete() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(self)
        }
    }
    
    func update(list: List, newNote: Note) {
        let note = self.read().first{ ($0.listId?.elementsEqual(list.id) ?? false) }
        print("Note Title")
        print(note?.title)
        let realm = try! Realm()
        try! realm.write {
            note?.title = newNote.title
            note?.detail = newNote.detail
        }
    }
    
}
