//
//  ViewController.swift
//  BaseUI
//
//  Created by Сергей Гнидь on 24.09.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var valueOfRedSlider: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var valueOfGreenSlider: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var valueOfBlueSlider: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var viewOfColors: UIView!
    
/// RGB Colors parametrs
    var redColor: Float = 0
    
    var greenColor: Float = 0
    
    var blueColor: Float = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redColor = Float(redSlider.value)
        greenColor = Float(greenSlider.value)
        blueColor = Float(blueSlider.value)
        changeColorView(red: redColor, green: greenColor, blue: blueColor)
        changeText(nil)
        changeColorOfSlider(nil)
    }
    
// MARK: - Changes to the view regarding colors.
    /// This method change background color for attached view for specific slider.
    ///
    /// - Parameter red: Value of red color in the range 0 - 1 from UIColor.
    /// - Parameter green: Value of green color in the range 0 - 1 from UIColor.
    /// - Parameter blue: Value of blue color in the range 0 - 1 from UIColor.
    
    
    func changeColorView(red: Float, green: Float, blue: Float) {
        if red != 0 || green != 0 || blue != 0 {
            redColor = red
            greenColor = green
            blueColor = blue
        }
        let color = UIColor(
            red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0
        )
        viewOfColors.backgroundColor = color
    }

//MARK: - Changes to text relative to slider values.
    /// This method change text for attached label for specific slider.
    ///
    /// - Parameter sender: The specific slider.
    
    func changeText(_ sender: UISlider?){
        if let sender = sender{
            switch sender.tag {
            case 1:
                valueOfRedSlider.text = String(sender.value)
                
            case 2:
                valueOfGreenSlider.text = String(sender.value)
                
            case 3:
                valueOfBlueSlider.text = String(sender.value)
                
            default:
                print("The specified tag could not be found")
            }
        }
        else {
            valueOfRedSlider.text = String(redSlider.value)
            valueOfGreenSlider.text = String(greenSlider.value)
            valueOfBlueSlider.text = String(blueSlider.value)
        }
    }
    
// MARK: - Changes sliders tint color.
    /// This method change tintColor  for specific slider.
    ///
    /// - Parameter sender: The specific slider.
    
    func changeColorOfSlider(_ sender: UISlider?) {
        if let sender = sender{
            switch sender.tag {
            case 1:
                redSlider.tintColor = UIColor(red: CGFloat(sender.value), green: 0, blue: 0, alpha: 1)
                
            case 2:
                greenSlider.tintColor = UIColor(red: 0, green: CGFloat(sender.value), blue: 0, alpha: 1)
                
            case 3:
                blueSlider.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(sender.value), alpha: 1)
                
            default:
                print("The specified tag could not be found")
            }
        }
        else {
            redSlider.tintColor = UIColor(red: CGFloat(redSlider.value), green: 0, blue: 0, alpha: 1)
            greenSlider.tintColor = UIColor(red: 0, green: CGFloat(greenSlider.value), blue: 0, alpha: 1)
            blueSlider.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(blueSlider.value), alpha: 1)
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
    

