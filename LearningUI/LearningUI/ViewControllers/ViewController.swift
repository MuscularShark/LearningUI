//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var textField: UITextField!

    let main = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }

   @IBAction private func pushSecondVC(_ sender: UIButton) {
        let secondVC = main.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
       
        guard let text = textField.text else { return }
       
        secondVC.textToTextField = text
        secondVC.delegate = self
       
        switch sender.tag {
           case 1:
               secondVC.view.backgroundColor = sender.backgroundColor
           case 2:
               secondVC.view.backgroundColor = sender.backgroundColor
           case 3:
               secondVC.view.backgroundColor = sender.backgroundColor
           default:
               print("Error")
        }
       
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension ViewController: SecondViewControllerDelegate {
    func delegateSecondVC(_ viewController: UIViewController, didUpdate text: String) {
        textField.text = text
    }
}
