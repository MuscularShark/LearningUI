//
//  ViewController.swift
//  BaseUI
//
//  Created by Сергей Гнидь on 24.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        label.isHidden.toggle()
    }
}

