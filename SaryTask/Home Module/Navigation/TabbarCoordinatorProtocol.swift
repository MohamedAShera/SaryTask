//
//  TabbarCoordinatorProtocol.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

protocol TabbarCoordinatorProtocol: Coordinator {
    var tabbarController: UITabBarController { get set }
    var currentTab: Int { get }
}
