//
//  ViewController.swift
//  BaseUIPicker
//
//  Created by Сергей Гнидь on 27.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldGender: UITextField!
    
    @IBOutlet weak var textFieldBirth: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    let pickerGender = UIPickerView()
    
    let pickerBirhday = UIDatePicker()
    
    ///Values for UIPickerView (pickerGender)
    
    var arrayOfGender = ["Female", "Male", "Unknown"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerGender.dataSource = self
        pickerGender.delegate = self
        textFieldGender.inputView = pickerGender
        textFieldBirth.inputView = pickerBirhday
        datePickerView()
        changeImage()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textFieldGender.textColor = .black
        textFieldBirth.textColor = .black
    }
    
    //MARK: - Method for change Image View
    
    func changeImage() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.contentMode = .scaleAspectFit
    }
    
    //MARK: - Method of DatePicker
    
    func datePickerView() {
        textFieldBirth.inputView = pickerBirhday
        pickerBirhday.datePickerMode = .date
        pickerBirhday.preferredDatePickerStyle = .wheels
        pickerBirhday.maximumDate = Date()
        pickerBirhday.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        textFieldBirth.textColor = .systemBlue
    }
        
    //MARK: - Method of date format
    
    @objc private func dateChanged() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        textFieldBirth.text = dateFormat.string(from: pickerBirhday.date)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Methods of UIPickerViewDelegate, UIPickerViewDataSource
    
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

