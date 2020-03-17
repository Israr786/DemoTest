//
//  UIStackView+Extension.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation
import  UIKit

extension UIStackView {
    static func createStackView(elements:[UIView], axis:NSLayoutConstraint.Axis, alignment:UIStackView.Alignment, distribution:UIStackView.Distribution,spacing:CGFloat)-> UIStackView {
        let stackView = UIStackView(arrangedSubviews:elements)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        return stackView
    }
}
