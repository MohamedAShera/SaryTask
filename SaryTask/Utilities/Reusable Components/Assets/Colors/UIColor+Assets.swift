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
    
//    enum HomeView {
//        static let homeCellBackgroundColor = "HomeCellBackgroundColor".uiColor
//        static let movieCellBackgroundColor = "MovieCellBackgroundColor".uiColor
//        static let homeHeaderBackgroundColor = "HomeHeaderBackgroundColor".uiColor
//    }
//
//    enum Controls {
//        enum BaseButton {
//            static let secondaryButtonColor = "SecondaryButtonColor".uiColor
//            static let SecondaryButtonBorderColor = "SecondaryButtonBorderColor".uiColor
//            static let SecondaryButtonTitleColor = "SecondaryButtonTitleColor".uiColor
//        }
//
//        enum BaseTextfield {
//            static let textfieldBackgroundColor = "TextfieldBackgroundColor".uiColor
//            static let textfieldPlaceHolderColor = "TextfieldPlaceHolderColor".uiColor
//        }
//    }
}

private extension String {
    var uiColor: UIColor {
        return UIColor(named: self) ?? .clear
    }
}
