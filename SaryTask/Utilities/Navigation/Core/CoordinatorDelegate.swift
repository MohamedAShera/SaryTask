//
//  CoordinatorDelegate.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidEnd(_ childCoordinator: Coordinator)
}
