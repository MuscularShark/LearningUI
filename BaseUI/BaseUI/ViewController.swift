//
//  ViewController.swift
//  BaseUI
//
//  Created by Сергей Гнидь on 24.09.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueTextfield: UITextField!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var viewOfColors: UIView!
    
/// Constant for max range RGB colors
    
    let valueCG: CGFloat = 255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeColorView()
        changeText()
        changeColorOfSlider()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextfield.delegate = self
    }
    
// MARK: - Changes to the view regarding colors.
    /// This method change background color for attached view for specific slider.
    
    private func changeColorView() {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        
        let color = UIColor(
            red: redColor / valueCG, green: greenColor / valueCG, blue: blueColor / valueCG, alpha: 1.0
        )
        viewOfColors.backgroundColor = color
    }

//MARK: - Changes to text relative to slider values.
    /// This method change text for attached textfield for specific slider.
    
    private func changeText() {
        redTextField.text = String(Int(redSlider.value))
        greenTextField.text = String(Int(greenSlider.value))
        blueTextfield.text = String(Int(blueSlider.value))
    }
    
// MARK: - Changes sliders tint color.
    /// This method change tintColor  for specific slider.
    
    private func changeColorOfSlider() {
        redSlider.tintColor = UIColor(red: CGFloat(redSlider.value) / valueCG, green: 0, blue: 0, alpha: 1)
        greenSlider.tintColor = UIColor(red: 0, green: CGFloat(greenSlider.value) / valueCG, blue: 0, alpha: 1)
        blueSlider.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(blueSlider.value) / valueCG, alpha: 1)
    }
    
// MARK: - Universal func for all sliders.
    /// This method call methods for specific slider.
    ///
    /// - Parameter sender: The specific slider.
    
    @IBAction func changeWithSliders(_ sender: UISlider) {
        changeText()
        changeColorOfSlider()
        changeColorView()
    }
}

extension ViewController: UITextFieldDelegate {
    
// MARK: - Settings for textfields
    /// This method set restriction for textfield
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text,
                  let textValue = Float(text + string)
            else { return false }
            if textValue > 255 {
                return false
            }
            return true
        }
        
// MARK: - Change color view with textfields
    /// This method set sliders values as textfields text and chande color for view
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            redSlider.value = Float(redTextField.text ?? " ") ?? 0.0
        case 2:
            greenSlider.value = Float(greenTextField.text ?? " ") ?? 0.0
        case 3:
            blueSlider.value = Float(blueTextfield.text ?? " ") ?? 0.0
        default:
            print("Error")
        }
        changeColorView()
        textField.resignFirstResponder()
        return true
    }
}
    

