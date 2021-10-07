//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class GestureViewController: UIViewController {
    
    @IBOutlet private weak var redView: UIView!
    
    @IBOutlet private weak var centerXConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var centerYConstraint: NSLayoutConstraint!
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private let pinchGestureRecognizer = UIPinchGestureRecognizer()
    
    private let rotateGestureRecognizer = UIRotationGestureRecognizer()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var panGestureAnchorPoint: CGPoint?
    
    private var defaultStateX: CGFloat?
    private var defaultStateY: CGFloat?
    
    private var scale: CGFloat?
    private var rotation: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultStateX = centerXConstraint.constant
        defaultStateY = centerYConstraint.constant
        
        setupGestures()

    }
    
    private func setupGestures() {
        pinchGestureRecognizer.delegate = self
        rotateGestureRecognizer.delegate = self
        
        panGestureRecognizer.addTarget(self, action: #selector(handPanGesture(_ :)))
        tapGestureRecognizer.addTarget(self, action: #selector(tapGesture(_ :)))
        pinchGestureRecognizer.addTarget(self, action: #selector(pinchGesture(_ :)))
        rotateGestureRecognizer.addTarget(self, action: #selector(rotateGesture(_ :)))

        panGestureRecognizer.maximumNumberOfTouches = 1

        redView.addGestureRecognizer(panGestureRecognizer)
        redView.addGestureRecognizer(tapGestureRecognizer)
        view.addGestureRecognizer(pinchGestureRecognizer)
        view.addGestureRecognizer(rotateGestureRecognizer)
    }
    
    @objc private func handPanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
        default:
            break
        }
    }
    
    @objc private func pinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        guard pinchGestureRecognizer === gestureRecognizer else { return }
        
        switch pinchGestureRecognizer.state {
        case .changed:
            scale = gestureRecognizer.scale
            if let scales = scale, let rotations = rotation{
                redView.transform = CGAffineTransform.identity.scaledBy(x: scales, y: scales).rotated(by: CGFloat(rotations))
            }
        default:
            break
        }
    }
    
    @objc private func rotateGesture(_ gestureRecognizer: UIRotationGestureRecognizer) {
        guard rotateGestureRecognizer === gestureRecognizer else { return }
        
        switch rotateGestureRecognizer.state {
        case .changed:
            rotation = gestureRecognizer.rotation
            if let rotations = rotation, let scales = scale {
                redView.transform = CGAffineTransform.identity.scaledBy(x: scales, y: scales).rotated(by: CGFloat(rotations))
            }
        default:
            break
        }
    }
    
    @objc private func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapGestureRecognizer === gestureRecognizer else { return }
        
        switch tapGestureRecognizer.state {
        case .ended:
            if let stateX = defaultStateX, let stateY = defaultStateY{
                centerXConstraint.constant = stateX
                centerYConstraint.constant = stateY
                redView.transform = .identity
            }
            redView.backgroundColor = .green
        default:
            break
        }
    }
}

extension GestureViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let simultaneousRecognizers = [panGestureRecognizer, pinchGestureRecognizer, rotateGestureRecognizer]
        return simultaneousRecognizers.contains(gestureRecognizer) && simultaneousRecognizers.contains(otherGestureRecognizer)
    }
}
