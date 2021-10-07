//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showSimpleAlert(_ sender: UIButton) {
        let signOutBtn = UIAlertAction(title: "Sign out", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert(
            title: "Sign Out?",
            message: "You can always access your content by signing back in",
            action: signOutBtn, cancelBtn,
            type: .alert
        )
    }
    
    @IBAction func showActionSheetAlert(_ sender: UIButton) {
        let approveBtn = UIAlertAction(title: "Approve", style: .default, handler: nil)
        let editBtn = UIAlertAction(title: "Edit", style: .default, handler: nil)
        let deleteBtn = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert(
            title: "Title",
            message: "Please Select an Option",
            action: approveBtn, editBtn, deleteBtn, dismiss,
            type: .actionSheet
        )
    }
    
    @IBAction func showAlertWithDestractiveBtn(_ sender: UIButton) {
        let signOutBtn = UIAlertAction(title: "Sign out", style: .destructive, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert(title: "Sign Out?",
              message: "You can always access your content by signing back in",
              action: signOutBtn, cancelBtn,
              type: .alert
        )
    }
    
    @IBAction func showAlertTwoBtn(_ sender: UIButton) {
        let defaultBtn = UIAlertAction(title: "Default", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let destructiveBtn = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)
        
        alert(
            title: "Alert",
            message: "Alert with more than 2 buttons",
            action: defaultBtn, cancelBtn, destructiveBtn,
            type: .alert
        )
    }
    
    @IBAction func showAlertTextField(_ sender: UIButton) {
        let defaultBtn = UIAlertAction(title: "Enter", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertWithTextfield(
            title: "Alert",
            message: "Alert with textfield",
            action: defaultBtn, cancelBtn,
            type: .alert,
            configurationHandlerTF: nil
        )
    }
}


