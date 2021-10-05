//
//  ViewController5.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fifth ViewController"
    }
    
    @IBAction private func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
