//
//  RealmManager.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import RealmSwift

class RealmManager {
    
    static var realm: Realm?
    
    init() {
        RealmManager.realm = try! Realm()
    }
    
}
