//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seconCard: UIImageView!
    
    @IBOutlet weak var firstCard: UIImageView!
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var cout = 0
    
    var arrayOfImages = ["Image", "Images"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGestures()
    }

    private func setupGestures() {

             //Set gestures delegate


             //Add gestures target
             tapGestureRecognizer.addTarget(self, action: #selector(tapGesture(_ :)))


             //Set touches of gestures
           

             //Add gestures in nesessary view
            view.addGestureRecognizer(tapGestureRecognizer)
         }

    @objc private func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
            guard tapGestureRecognizer === gestureRecognizer else { return }
            switch tapGestureRecognizer.state {
            case .ended:
                if let secon = seconCard, let first = firstCard{
                    if cout == 0 {
                        UIView.transition(from: secon, to: first, duration: 1, options: [.transitionFlipFromBottom, .showHideTransitionViews])
                        cout = 1
                        firstCard.image = UIImage(named: arrayOfImages[0])
                    }
                    else {
                        UIView.transition(from: first, to: secon, duration: 1, options: [.transitionFlipFromBottom, .showHideTransitionViews])
                        cout = 0
                        firstCard.image = UIImage(named: arrayOfImages[1])
                    }
                }
                
            default:
                break
            
            }
        }
}

