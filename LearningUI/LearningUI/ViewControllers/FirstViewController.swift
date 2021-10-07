//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First ViewController"
    }
    
    @IBAction func goToSecondScreenTouchUpInside(_ sender: UIButton) {
        let secondViewController: SecondUIViewController = UIStoryboard.instantiateViewController()
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func goToThirdScreenTouchUpInside(_ sender: UIButton) {
        let thirdViewController: ThirdUIViewController = UIStoryboard.instantiateViewController()
        
        thirdViewController.modalPresentationStyle = .fullScreen
        present(thirdViewController, animated: true)
    }

    @IBAction func goToFourScreenTouchUpInside(_ sender: UIButton) {
        let fourViewController: FourthViewController = UIStoryboard.instantiateViewController()
        let navVC = UINavigationController(rootViewController: fourViewController)
        
        navVC.modalPresentationStyle = .fullScreen
        navigationController?.present(navVC, animated: true)
    }
}

