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
        let alert = UIAlertController(title: "Sign Out?", message: "You can always access your content by signing back in", preferredStyle: .alert)
        
        let signOutBtn = UIAlertAction(title: "Sign out", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelBtn)
        alert.addAction(signOutBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheetAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        let approveBtn = UIAlertAction(title: "Approve", style: .default, handler: nil)
        let editBtn = UIAlertAction(title: "Edit", style: .default, handler: nil)
        let deleteBtn = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(approveBtn)
        alert.addAction(editBtn)
        alert.addAction(deleteBtn)
        alert.addAction(dismiss)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showAlertWithDestractiveBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sign Out?", message: "You can always access your content by signing back in", preferredStyle: .alert)
        
        let signOutBtn = UIAlertAction(title: "Sign out", style: .destructive, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelBtn)
        alert.addAction(signOutBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showAlertTwoBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Alert with more than 2 buttons", preferredStyle: .alert)
        
        let defaultBtn = UIAlertAction(title: "Default", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let destructiveBtn = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)
        
        alert.addAction(defaultBtn)
        alert.addAction(cancelBtn)
        alert.addAction(destructiveBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showAlertTextField(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Alert with textfield", preferredStyle: .alert)
        
        let defaultBtn = UIAlertAction(title: "Enter", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(cancelBtn)
        alert.addAction(defaultBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
}

