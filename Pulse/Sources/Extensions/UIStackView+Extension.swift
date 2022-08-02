//
//  UIStackView+Extension.swift
//  Pulse
//
//  Created by Михаил Багмет on 30.07.2022.
//

import UIKit

extension UIStackView {
    static func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing

        return stackView
    }
}
