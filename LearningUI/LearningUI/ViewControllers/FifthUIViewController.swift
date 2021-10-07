//
//  ViewController5.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class FifthUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fifth ViewController"
    }
    
    @IBAction private func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
