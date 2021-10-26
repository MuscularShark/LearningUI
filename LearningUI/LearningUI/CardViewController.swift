//
//  CardViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet private weak var seconCardImageView: UIImageView!
    @IBOutlet private weak var firstCardImageView: UIImageView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var constraintY: NSLayoutConstraint!
    @IBOutlet private weak var constraintX: NSLayoutConstraint!
    @IBOutlet private weak var hintsLabel: UILabel!
    @IBOutlet private weak var tryButton: UIButton!
    @IBOutlet weak var backCardView: UIView!
    @IBOutlet weak var secondConstraintX: NSLayoutConstraint!
    
    private var defaultX: CGFloat = 0
    
    private var defaultY: CGFloat = 0
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private let secondPanGestureRecognizer = UIPanGestureRecognizer()
    
    
    
    private var coutOfRotate = 0
    
    private var panGestureAnchorPoint: CGPoint?
    
    private let valueOut: CGFloat = 480
    
    private enum State {
        case left
        case right
        case center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultValue()
        setupGestures()
    }
    
    private func setDefaultValue() {
        defaultX = constraintX.constant
        defaultY = constraintY.constant
    }

    private func setupGestures() {
        tapGestureRecognizer.addTarget(self, action: #selector(tapGesture(_:)))
        panGestureRecognizer.addTarget(self, action: #selector(panGesture(_:)))
        secondPanGestureRecognizer.addTarget(self, action: #selector(secondPanGesture(_:)))

        cardView.addGestureRecognizer(tapGestureRecognizer)
        cardView.addGestureRecognizer(panGestureRecognizer)
        backCardView.addGestureRecognizer(secondPanGestureRecognizer)
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
    
    private func rotateCard(card: UIView, angle: CGFloat) {
        UIView.animate(withDuration: 0.3, animations: {
            card.transform = CGAffineTransform.identity.rotated(by: angle)
        })
    }
    
    private func actionTryAgain() {
        tryButton.isHidden = true
        hintsLabel.text = "Tap to card"
        constraintX.constant = defaultX
    }
    
    @IBAction private func clickTry(_ sender: UIButton) {
        actionTryAgain()
        addCard(card: cardView)
    }
    
    func backEffect(card: UIView, scaleX: CGFloat, scaleY: CGFloat) {
        UIView.animate(withDuration: 0.8, animations: {
            card.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        })
    }
    
    private func getOut(state: State, constant: NSLayoutConstraint) {
        UIView.animate(withDuration: 0.4, animations: {
            switch state {
            case .left:
                self.hintsLabel.text = "You swiped card left"
                constant.constant -= self.valueOut
            case .right:
                self.hintsLabel.text = "You swiped card right"
                constant.constant += self.valueOut
            case .center:
                self.hintsLabel.text = "Not enought to swipe"
                constant.constant = self.defaultX
                self.tryButton.isHidden = true
            }
            self.view.layoutIfNeeded()
        })
    }
    
    @objc private func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapGestureRecognizer === gestureRecognizer else { return }
        
        guard let second = seconCardImageView, let first = firstCardImageView else { return }
        
        switch tapGestureRecognizer.state {
        case .ended:
            if coutOfRotate == 0 {
                updateCard(card1: second, card2: first, scale: true)
                hintsLabel.text = "Tap again to close card"
                coutOfRotate = 1
            }
            else {
                updateCard(card1: first, card2: second, scale: false)
                hintsLabel.text = "You can swipe card left or right"
                coutOfRotate = 0
            }
        default:
            break
        }
    }
    
    
    
    
    
    
    
    @objc private func panGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else { return }
        
        switch panGestureRecognizer.state {
        case .began:
            backCardView.isHidden = true
            backCardView.transform = .identity
            secondConstraintX.constant = defaultX
            view.sendSubviewToBack(backCardView)
            view.bringSubviewToFront(cardView)
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            backCardView.isHidden = false
            backEffect(card: backCardView, scaleX: 1.04, scaleY: 1.04)
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
            backEffect(card: backCardView, scaleX: 1, scaleY: 1)
            if constraintX.constant < -50 {
                getOut(state: .left, constant: constraintX)
            }
            else if constraintX.constant > 50 {
                getOut(state: .right, constant: constraintX)
            }
            else {
                getOut(state: .center, constant: constraintX)
                rotateCard(card: cardView, angle: 0)
            }
        default:
            break
        }
    }
    
    
    
    
    
    
    
    
    
    
    @objc private func secondPanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard secondPanGestureRecognizer === gestureRecognizer else { return }
        
        switch secondPanGestureRecognizer.state {
        case .began:
            cardView.isHidden = true
            cardView.transform = .identity
            constraintX.constant = defaultX
            view.sendSubviewToBack(cardView)
            view.bringSubviewToFront(backCardView)
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
            print("Ok")
        case .changed:
            cardView.isHidden = false
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            backEffect(card: cardView, scaleX: 1.04, scaleY: 1.04)
            secondConstraintX.constant += gesturePoint.x - panGestureAnchorPoint.x
            self.panGestureAnchorPoint = gesturePoint
            if secondConstraintX.constant > 0 {
                rotateCard(card: backCardView, angle: 0.3)
            }
            if secondConstraintX.constant < 0 {
                rotateCard(card: backCardView, angle: -0.3)
            }
        case .ended:
            backEffect(card: cardView, scaleX: 1, scaleY: 1)
            if secondConstraintX.constant < -50 {
                getOut(state: .left, constant: secondConstraintX)
            }
            else if secondConstraintX.constant > 50 {
                getOut(state: .right, constant: secondConstraintX)
            }
            else {
                getOut(state: .center, constant: secondConstraintX)
                rotateCard(card: backCardView, angle: 0)
            }
        default:
            break
        }
    }
}
