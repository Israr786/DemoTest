//
//  UILabel+Extension.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation
import  UIKit

extension UILabel {
    static func createLabel(with text:String = "" ) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
}
