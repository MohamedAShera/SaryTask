//
//  AppCoordinator.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: CoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let splashCoordinator = TabbarCoordinator(navigationController)
        childCoordinators.append(splashCoordinator)
        splashCoordinator.start()
    }
}

