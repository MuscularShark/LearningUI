//
//  ViewController4.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fourth ViewController"
    }
    
    @IBAction private func makeNavController() {
        let fiveViewController: FifthViewController = UIStoryboard.instantiateViewController()
       
        navigationController?.pushViewController(fiveViewController, animated: true)
    }
}
