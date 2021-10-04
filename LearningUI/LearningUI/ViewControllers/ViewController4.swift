//
//  ViewController4.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fourth ViewController"
    }
    
    
    @IBAction private func makeNavController() {
        let fiveViewController: ViewController5 = UIStoryboard.instantiateViewController()
       
        self.navigationController?.pushViewController(fiveViewController, animated: true)
    }
    
    @IBAction func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
