//
//  SecondViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class SecondUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second ViewController"
    }
    
    @IBAction private func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
