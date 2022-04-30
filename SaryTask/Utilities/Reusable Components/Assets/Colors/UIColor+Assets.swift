//
//  UIColor+Assets.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import UIKit

extension UIColor {
    enum Core {
        static let tabbarIconColor = "tabbarIconColor".uiColor
    }
}

private extension String {
    var uiColor: UIColor {
        return UIColor(named: self) ?? .clear
    }
}
