//
//  Images+Assets.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import UIKit

extension UIImage {
    enum TabBar {
        static let home = "store".uiImage
        static let profile = "profile".uiImage
        static let order = "order".uiImage
    }
    enum General {
        static let placeholder = "placeholder".uiImage
    }
}

private extension String {
    var uiImage: UIImage {
        return UIImage(named: self) ?? UIImage()
    }
}
