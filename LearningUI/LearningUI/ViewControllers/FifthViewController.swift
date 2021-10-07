//
//  ViewController5.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fifth ViewController"
    }
    
    @IBAction func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
