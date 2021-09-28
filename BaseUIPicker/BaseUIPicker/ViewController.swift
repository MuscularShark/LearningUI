//
//  ViewController.swift
//  BaseUIPicker
//
//  Created by Сергей Гнидь on 27.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textFieldGender: UITextField!
    
    @IBOutlet private weak var textFieldBirth: UITextField!
    
    @IBOutlet private weak var profileImage: UIImageView!
    
    private let pickerGender = UIPickerView()
    
    private let pickerBirhday = UIDatePicker()
    
    ///Values for UIPickerView (pickerGender)
    
    private var arrayOfGender = ["Female", "Male", "Unknown"]
    
    
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
    }
    
    //MARK: - Method for change Image View
    
    private func changeImage() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.contentMode = .scaleAspectFit
    }
    
    //MARK: - Method of DatePicker
    
    private func datePickerView() {
        textFieldBirth.inputView = pickerBirhday
        pickerBirhday.datePickerMode = .date
        pickerBirhday.preferredDatePickerStyle = .wheels
        pickerBirhday.maximumDate = Date()
        pickerBirhday.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
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
    }
}

