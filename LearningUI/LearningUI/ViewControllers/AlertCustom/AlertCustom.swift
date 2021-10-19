//
//  AlertCustom.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 18.10.2021.
//

import UIKit

protocol AlertDelegate {
    func actionBtn()
}

class AlertCustom: UIView {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var actionBtn: UIButton!
    
    var delegate: AlertDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStackView()
    }
    
    func set(title: String, message: String, buttonTitle: String) {
        titleLabel.text = title
        messageLabel.text = message
        actionBtn.setTitle(buttonTitle, for: .normal)
    }
    
    private func setupStackView() {
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction private func actionBtn(_ sender: UIButton) {
        delegate?.actionBtn()
    }
}
