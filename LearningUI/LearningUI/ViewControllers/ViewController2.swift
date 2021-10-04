//
//  ViewController2.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 04.10.2021.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func delegateSecondVC(_ viewController: UIViewController, didUpdate text: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak private var textFieldSecondVC: UITextField!
    
    weak var delegate: SecondViewControllerDelegate?
    
    var textToTextField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSecondVC.text = textToTextField
        textFieldSecondVC.delegate = self
    }
    
}

extension SecondViewController: UITextFieldDelegate  {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        delegate?.delegateSecondVC(self, didUpdate: textFieldSecondVC.text ?? " ")
        
        navigationController?.popViewController(animated: true)
        
        return true
    }
}


