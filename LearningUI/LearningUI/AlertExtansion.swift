//
//  AlertExtansion.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 07.10.2021.
//

import UIKit

extension UIViewController {
    func alert(title: String, message: String, action: UIAlertAction..., type: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: type)

        for (_, element) in action.enumerated() {
            alertController.addAction(element)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    func alertWithTextfield(title: String, message: String, action: UIAlertAction..., type: UIAlertController.Style, configurationHandlerTF: ((UITextField) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: type)
        
        alertController.addTextField(configurationHandler: configurationHandlerTF)
        for (_, element) in action.enumerated() {
            alertController.addAction(element)
        }
        present(alertController, animated: true, completion: nil)
    }
}
