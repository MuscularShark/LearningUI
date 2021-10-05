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
        self.title = "Second ViewController"
    }
    
    @IBAction func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
