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
        valueOfRedSlider.text = String(redSlider.value)
        valueOfGreenSlider.text = String(greenSlider.value)
        valueOfBlueSlider.text = String(blueSlider.value)
    }

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

    
    
    
    @IBAction func changeRedSlider(_ sender: UISlider) {
        changeColorView(red: Float(sender.value), green: greenColor, blue: blueColor)
        valueOfRedSlider.text = String(redSlider.value)
        redSlider.tintColor = UIColor(red: CGFloat(sender.value), green: 0, blue: 0, alpha: 1)
    }
    
    
    
    @IBAction func changeGreenSlider(_ sender: UISlider) {
        changeColorView(red: redColor, green: Float(sender.value), blue: blueColor)
        valueOfGreenSlider.text = String(greenSlider.value)
        greenSlider.tintColor = UIColor(red: 0, green: CGFloat(sender.value), blue: 0, alpha: 1)
    }
    
    
    
    @IBAction func changeBlueSlider(_ sender: UISlider) {
        changeColorView(red: redColor, green: greenColor, blue: Float(sender.value))
        valueOfBlueSlider.text = String(blueSlider.value)
        blueSlider.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(sender.value), alpha: 1)
    }
    
    
}
    

