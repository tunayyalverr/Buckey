//
//  UIViewControllerExtension.swift
//  Buckey
//
//  Created by tunay alver on 15.04.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: - Identifier
    class var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - Hide Keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func close() {
        if navigationController != nil {
            self.navigationController?.popToRootViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func popBack() {
        if navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Navigation Controller
    func setNavigationBarBackButtonEmpty() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .textTertiary
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func addAppIconToNavbar() {
        let logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoView.image = UIImage(named: "ic_logo_30")
        logoView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = logoView
    }
    
    //MARK: - Alert
    func performAlert(title: String, message: String, buttonTitle: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }
    
    func showEmptyError(fieldName: String) {
        performAlert(title: Strings.errorTitle , message: fieldName + " " + Strings.sholdNotEmpty, buttonTitle: Strings.ok, style: .alert)
    }

}
