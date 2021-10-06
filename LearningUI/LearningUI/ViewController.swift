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
    
    @IBOutlet weak var backCard: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var constraintY: NSLayoutConstraint!
    
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    
    @IBOutlet weak var hints: UILabel!
    
    @IBOutlet weak var tryBtn: UIButton!
    
    private var defaultX: CGFloat = 0
    
    private var defaultY: CGFloat = 0
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private var coutOfRotate = 0
    
    private var panGestureAnchorPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultX = constraintX.constant
        defaultY = constraintY.constant
        setupGestures()
    }

    private func setupGestures() {
        //Add gestures target
        tapGestureRecognizer.addTarget(self, action: #selector(tapGesture(_ :)))
        panGestureRecognizer.addTarget(self, action: #selector(panGesture(_ :)))

        //Add gestures in nesessary view
        cardView.addGestureRecognizer(tapGestureRecognizer)
        cardView.addGestureRecognizer(panGestureRecognizer)
    }

    private func updateCard(card1: UIImageView, card2: UIImageView, scale: Bool) {
        guard let constantX = constraintX,
              let constantY = constraintY,
              let viewOfCard = cardView else { return }
        
        UIView.transition(from: card1, to: card2, duration: 1.5, options: [.transitionFlipFromBottom, .showHideTransitionViews]) { _ in
            UIView.animate(withDuration: 1.5, animations: {
                constantX.constant = self.defaultX
                constantY.constant = self.defaultY
                if scale {
                    viewOfCard.transform = CGAffineTransform.identity.scaledBy(x: 1.8, y: 1.8)
                }
                else {
                    viewOfCard.transform = CGAffineTransform.identity
                }
            })
        }
    }
    
    private func addCard(card: UIView) {
        card.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2).rotated(by: 0)
        UIView.animate(withDuration: 1.9, animations: {
            card.transform = CGAffineTransform.identity
        })
    }
    
    private func rotateCard(card: UIView, angle: CGFloat){
        UIView.animate(withDuration: 0.3, animations: {
            card.transform = CGAffineTransform.identity.rotated(by: angle)
        })
    }
    
    @objc private func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapGestureRecognizer === gestureRecognizer else { return }
        
        guard let second = seconCard, let first = firstCard else { return }
        
        switch tapGestureRecognizer.state {
            case .ended:
                if coutOfRotate == 0 {
                    updateCard(card1: second, card2: first, scale: true)
                    hints.text = "Tap again to close card"
                    coutOfRotate = 1
                }
                else {
                    updateCard(card1: first, card2: second, scale: false)
                    hints.text = "You can swipe card left or right"
                    coutOfRotate = 0
                }
            default:
                break
        }
    }
    
    @IBAction func clickTry(_ sender: UIButton) {
        tryBtn.isHidden = true
        hints.text = "Tap to card"
        constraintX.constant = defaultX
        addCard(card: cardView)
    }
    
    @objc private func panGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else { return }
        
        switch panGestureRecognizer.state {
            case .began:
                panGestureAnchorPoint = gestureRecognizer.location(in: view)
            case .changed:
                guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
                let gesturePoint = gestureRecognizer.location(in: view)
                constraintX.constant += gesturePoint.x - panGestureAnchorPoint.x
                self.panGestureAnchorPoint = gesturePoint
            
                if constraintX.constant > 0 {
                    rotateCard(card: cardView, angle: 0.3)
                }
                if constraintX.constant < 0 {
                    rotateCard(card: cardView, angle: -0.3)
                }
            case .ended:
                if constraintX.constant < -50 {
                    hints.text = "You swiped card left"
                    constraintX.constant += -480
                    tryBtn.isHidden = false
                }
                else if constraintX.constant > 50 {
                    hints.text = "You swiped card right"
                    constraintX.constant += 480
                    tryBtn.isHidden = false
                }
                else {
                    hints.text = "Not enought to swipe"
                    constraintX.constant = defaultX
                    rotateCard(card: cardView, angle: 0)
                }
            default:
                break
        }
    }
}

