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
    
/// RGB Colors parametrs
    
    var redColor: Float = 0
    
    var greenColor: Float = 0
    
    var blueColor: Float = 0
    
/// Constant for max range RGB colors
    
    let valueCG: CGFloat = 255
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redColor = Float(redSlider.value)
        greenColor = Float(greenSlider.value)
        blueColor = Float(blueSlider.value)
        changeColorView(red: redColor, green: greenColor, blue: blueColor)
        changeText(nil)
        changeColorOfSlider(nil)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextfield.delegate = self
    }
    
// MARK: - Changes to the view regarding colors.
    /// This method change background color for attached view for specific slider.
    ///
    /// - Parameter red: Value of red color in the range 0 - 255 from UIColor.
    /// - Parameter green: Value of green color in the range 0 - 255 from UIColor.
    /// - Parameter blue: Value of blue color in the range 0 - 255 from UIColor.
    
    private func changeColorView(red: Float, green: Float, blue: Float) {
        if red != 0 || green != 0 || blue != 0 {
            redColor = red
            greenColor = green
            blueColor = blue
        }
        let color = UIColor(
            red: CGFloat(redColor) / valueCG, green: CGFloat(greenColor) / valueCG, blue: CGFloat(blueColor) / valueCG, alpha: 1.0
        )
        viewOfColors.backgroundColor = color
    }

//MARK: - Changes to text relative to slider values.
    /// This method change text for attached textfield for specific slider.
    ///
    /// - Parameter sender: The specific slider.
    
    private func changeText(_ sender: UISlider?){
        if let sender = sender{
            switch sender.tag {
            case 1:
                redTextField.text = String(Int(sender.value))
                
            case 2:
                greenTextField.text = String(Int(sender.value))
                
            case 3:
                blueTextfield.text = String(Int(sender.value))
                
            default:
                print("The specified tag could not be found")
            }
        }
        else {
            redTextField.text = String(Int(redSlider.value))
            greenTextField.text = String(Int(greenSlider.value))
            blueTextfield.text = String(Int(blueSlider.value))
        }
    }
    
// MARK: - Changes sliders tint color.
    /// This method change tintColor  for specific slider.
    ///
    /// - Parameter sender: The specific slider.
    
    private func changeColorOfSlider(_ sender: UISlider?) {
        if let sender = sender{
            switch sender.tag {
            case 1:
                redSlider.tintColor = UIColor(red: CGFloat(sender.value) / valueCG, green: 0, blue: 0, alpha: 1)
                
            case 2:
                greenSlider.tintColor = UIColor(red: 0, green: CGFloat(sender.value) / valueCG, blue: 0, alpha: 1)
                
            case 3:
                blueSlider.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(sender.value) / valueCG, alpha: 1)
                
            default:
                print("The specified tag could not be found")
            }
        }
        else {
            redSlider.tintColor = UIColor(red: CGFloat(redSlider.value) / valueCG, green: 0, blue: 0, alpha: 1)
            greenSlider.tintColor = UIColor(red: 0, green: CGFloat(greenSlider.value) / valueCG, blue: 0, alpha: 1)
            blueSlider.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(blueSlider.value) / valueCG, alpha: 1)
        }
    }
    
// MARK: - Universal func for all sliders.
    /// This method call methods for specific slider.
    ///
    /// - Parameter sender: The specific slider.
    
    @IBAction func changeWithSliders(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            changeText(redSlider)
            changeColorOfSlider(redSlider)
            changeColorView(red: Float(sender.value), green: greenColor, blue: blueColor)
            
        case 2:
            changeText(greenSlider)
            changeColorView(red: redColor, green: Float(sender.value), blue: blueColor)
            changeColorOfSlider(greenSlider)
            
        case 3:
            changeColorView(red: redColor, green: greenColor, blue: Float(sender.value))
            changeText(blueSlider)
            changeColorOfSlider(blueSlider)
           
        default:
            print("The specified tag could not be found")
        }
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
            changeColorOfSlider(redSlider)
        case 2:
            greenSlider.value = Float(greenTextField.text ?? " ") ?? 0.0
            changeColorOfSlider(greenSlider)
        case 3:
            blueSlider.value = Float(blueTextfield.text ?? " ") ?? 0.0
            changeColorOfSlider(blueSlider)
        default:
            print("Error")
        }
        changeColorView(red: Float(redSlider.value), green: Float(greenSlider.value), blue: Float(blueSlider.value))
        textField.resignFirstResponder()
        return true
    }
}
    

