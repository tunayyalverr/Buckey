//
//  UIViewControllerDialogExtension.swift
//  Buckey
//
//  Created by tunay alver on 16.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: - Present
    func presentScreen(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.present(viewControllerToPresent, animated: animated, completion: completion)
        }
    }
    
    func showAddListDialog(delegate: AddListDialogDelegate) {
        let dialog = AddListDialog(delegate: delegate)
        self.presentScreen(dialog, animated: true)
    }
    
    func showAddNoteDialog(delegate: AddNoteDialogDelegate, list: List) {
        let dialog = AddNoteDialog(delegate: delegate, list: list, note: nil, style: .add)
        self.presentScreen(dialog, animated: true)
    }
    
    func showEditNoteDialog(delegate: AddNoteDialogDelegate, list: List, note: Note) {
        let dialog = AddNoteDialog(delegate: delegate, list: list, note: note, style: .edit)
        self.presentScreen(dialog, animated: true)
    }
    
}
