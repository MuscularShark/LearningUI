//
//  ViewController2.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 04.10.2021.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func textFieldReturn(_ viewController: UIViewController, didUpdate text: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak private var inputTextField: UITextField!
    
    weak var delegate: SecondViewControllerDelegate?
    
    var textToTextField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.text = textToTextField
        setUpDelegate()
    }
    
    private func setUpDelegate() {
        inputTextField.delegate = self
    }
}

extension SecondViewController: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        delegate?.textFieldReturn(self, didUpdate: inputTextField.text ?? " ")
        navigationController?.popViewController(animated: true)
        return true
    }
}


