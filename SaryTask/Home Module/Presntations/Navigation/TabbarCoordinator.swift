//
//  TabbarCoordinator.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

final class TabbarCoordinator: NSObject, TabbarCoordinatorProtocol {
    private let storeViewController = HomeViewController()
    private let orderViewController = UIViewController()
    private let profileViewController = UIViewController()
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabbarController: UITabBarController
    weak var delegate: CoordinatorDelegate?
    
    var currentTab: Int {
        return tabbarController.selectedIndex
    }
    
    init(
        _ navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        self.tabbarController = .init()
    }
    
    func start() {
        setTabbarControllers()
        prepareTabBarController()
    }
}

// MARK: - Private Methods

private extension TabbarCoordinator {
    func setTabbarControllers() {
        let views: [TabbarItemView] = [
            .store,
            .orders,
            .profile
        ].sorted(by: { $0.orderNumber < $1.orderNumber })
        
        let viewControllers: [UINavigationController] = views.map({ getTabController($0) })
        tabbarController.setViewControllers(viewControllers, animated: false)
    }
    
    func prepareTabBarController() {
        tabbarController.delegate = self
        tabbarController.selectedIndex = TabbarItemView.store.orderNumber
        tabbarController.tabBar.isTranslucent = false
        tabbarController.tabBar.tintColor = UIColor.Core.tabbarIconColor
        tabbarController.tabBar.backgroundColor = .white
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.setViewControllers([tabbarController], animated: false)
        navigationController.isNavigationBarHidden = true
    }
    
    func getTabController(_ itemView: TabbarItemView) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)

        navigationController.tabBarItem = UITabBarItem.init(
            title: itemView.title,
            image: itemView.iconImage,
            tag: itemView.orderNumber
        )
        setViewController(for: itemView, to: navigationController)
        return navigationController
    }
    
    func setViewController(
        for page: TabbarItemView,
        to navigationController: UINavigationController
    ) {
        switch page {
        case .store:
            storeViewController.coordinator = self
            navigationController.pushViewController(storeViewController, animated: true)
    
        case .orders:
            navigationController.pushViewController(orderViewController, animated: true)

        case .profile:
            navigationController.pushViewController(profileViewController, animated: true)
        }
    }
}

// MARK: - CoordinatorEndDelegate

extension TabbarCoordinator: CoordinatorDelegate {
    func coordinatorDidEnd(_ childCoordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === childCoordinator })
        
        switch childCoordinator {
        case is HomeViewController:
            setTabbarControllers()
            break
            
        default:
            break
        }
    }
}

// MARK: - UITabBarControllerDelegate

extension TabbarCoordinator: UITabBarControllerDelegate {}

