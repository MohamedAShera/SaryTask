//
//  TabbarItemView.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

enum TabbarItemView {
    case store
    case orders
    case profile
}

extension TabbarItemView {
    var title: String {
        switch self {
        case .store:
            return "Store"
            
        case .orders:
            return "Orders"
        case .profile:
            return "My Profile"
        }
    }
    
    var orderNumber: Int {
        switch self {
        case .store:
            return 0
            
        case .orders:
            return 1
            
        case .profile:
            return 2
        }
    }
    
    var iconImage: UIImage {
        switch self {
        case .store:
            return UIImage.TabBar.home
            
        case .orders:
            return UIImage.TabBar.order
            
        case .profile:
            return UIImage.TabBar.profile
        }
    }
}

