//
//  ViewController.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 28.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var alert: AlertCustom = {
        let alert: AlertCustom = AlertCustom.loadFromNib()
        alert.delegate = self
        return alert
    }()
    
    private let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVisualEffectView()
    }
    
    private func setupAlert() {
        view.addSubview(alert)
        alert.center = view.center
        alert.set(title: "Title", message: "Some message", buttonTitle: "OK")
    }
    
    private func setupVisualEffectView() {
        view.addSubview(visualEffectView)
        visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.alpha = 0
    }
    
    private func animateIn() {
        alert.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alert.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffectView.alpha = 1
            self.alert.alpha = 1
            self.alert.transform = CGAffineTransform.identity
        })
    }
    
    private func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffectView.alpha = 0
            self.alert.alpha = 0
            self.alert.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.alert.removeFromSuperview()
        }
    }

    @IBAction private func showPopUp(_ sender: UIButton) {
        setupAlert()
        animateIn()
    }
}

extension MainViewController: AlertDelegate {
    func actionBtn() {
        animateOut()
    }
}

