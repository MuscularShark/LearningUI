//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private func drawStar() {
        let startWith = self.view.frame.width
        let startHeight = self.view.frame.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: startWith / 2, y: startHeight / 2 - 10))
        path.addLine(to: CGPoint(x: startWith / 2 + 50, y: startHeight / 2 + 18))    //1 line
        path.addLine(to: CGPoint(x: startWith / 2 + 100, y: startHeight / 2 - 10))   //2 line
        path.addLine(to: CGPoint(x: startWith / 2 + 100, y: startHeight / 2 + 50))   //3 line
        path.addLine(to: CGPoint(x: startWith / 2 + 135, y: startHeight / 2 + 85))   //4 line
        path.addLine(to: CGPoint(x: startWith / 2 + 80, y: startHeight / 2 + 100))   //5 line
        path.addLine(to: CGPoint(x: startWith / 2 + 50, y: startHeight / 2 + 150))   //6 line
        path.addLine(to: CGPoint(x: startWith / 2 + 20, y: startHeight / 2 + 100))   //7 line
        path.addLine(to: CGPoint(x: startWith / 2 - 40, y: startHeight / 2 + 85))    //8 line
        path.addLine(to: CGPoint(x: startWith / 2, y: startHeight / 2 + 50))         //9 line
        path.close()

        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 5

        view.layer.addSublayer(shapeLayer)
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            drawStar()
    }


}

