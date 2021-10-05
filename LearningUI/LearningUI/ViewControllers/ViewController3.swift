//
//  ThirdUIViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 01.10.2021.
//

import UIKit

class ThirdUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 27))
        label.center = CGPoint(x: view.frame.width / 2, y: view.frame.height * 0.1)
        label.textAlignment = .center
        label.text = "Third ViewController"
        label.font = label.font.withSize(25)
        self.view.addSubview(label)
    }
    
    @IBAction func goToPrevScreeenTouchUpInside(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
