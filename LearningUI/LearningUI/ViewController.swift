//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private func drawStar() {
        let startWidth = view.frame.width / 2
        let startHeight = view.frame.height / 2
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: startWidth, y: startHeight - 10))
        path.addLine(to: CGPoint(x: startWidth + 50, y: startHeight + 18))    //1 line
        path.addLine(to: CGPoint(x: startWidth + 100, y: startHeight - 10))   //2 line
        path.addLine(to: CGPoint(x: startWidth + 100, y: startHeight + 50))   //3 line
        path.addLine(to: CGPoint(x: startWidth + 135, y: startHeight + 85))   //4 line
        path.addLine(to: CGPoint(x: startWidth + 80, y: startHeight + 100))   //5 line
        path.addLine(to: CGPoint(x: startWidth + 50, y: startHeight + 150))   //6 line
        path.addLine(to: CGPoint(x: startWidth + 20, y: startHeight + 100))   //7 line
        path.addLine(to: CGPoint(x: startWidth - 40, y: startHeight + 85))    //8 line
        path.addLine(to: CGPoint(x: startWidth, y: startHeight + 50))         //9 line
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
            drawStar()
    }
}

