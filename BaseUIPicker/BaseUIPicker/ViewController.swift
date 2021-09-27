//
//  ViewController.swift
//  BaseUIPicker
//
//  Created by Сергей Гнидь on 27.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldGender: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var pickerGender = UIPickerView()
    
    var arrayOfGender = ["Female", "Male", "Unknown"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImage.layer.cornerRadius = 55
        profileImage.clipsToBounds = true
        pickerGender.dataSource = self
        pickerGender.delegate = self
        textFieldGender.inputView = pickerGender
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textFieldGender.textColor = .black
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfGender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfGender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldGender.text = arrayOfGender[row]
        textFieldGender.textColor = .systemBlue
    }
}

