//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak private var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
    }

    private func setUpDelegate() {
        textField.delegate = self
    }
    
    @IBAction private func pushSecondVC(_ sender: UIButton) {
        let secondVC: SecondViewController = UIStoryboard.instantiateViewController()
        
        guard let text = textField.text else { return }
       
        secondVC.textToTextField = text
        secondVC.delegate = self
        secondVC.view.backgroundColor = sender.backgroundColor
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension FirstViewController: SecondViewControllerDelegate {
    func textFieldReturn(_ viewController: UIViewController, didUpdate text: String) {
        textField.text = text
    }
}
