//
//  ExtensionAlert.swift
//  LearningUI
//
//  Created by Сергей Гнидь on 19.10.2021.
//

import UIKit

extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        guard let nib = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil) else { fatalError() }
        guard let loadNib = nib[0] as? T else { fatalError() }
        return loadNib
    }
}
