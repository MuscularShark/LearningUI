//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First ViewController"
    }
    
    @IBAction func goToSecondScreenTouchUpInside(_ sender: UIButton) {
        let secondViewController: SecondUIViewController = UIStoryboard.instantiateViewController()
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func goToThirdScreenTouchUpInside(_ sender: UIButton) {
        let thirdViewController: ThirdUIViewController = UIStoryboard.instantiateViewController()
        
        thirdViewController.modalPresentationStyle = .fullScreen
        
        present(thirdViewController, animated: true)
    }

    
    @IBAction func goToFourScreenTouchUpInside(_ sender: UIButton) {
        let fourViewController: ViewController4 = UIStoryboard.instantiateViewController()
        let navVC = UINavigationController(rootViewController: fourViewController)
        
        navVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.present(navVC, animated: true)
    }

}

