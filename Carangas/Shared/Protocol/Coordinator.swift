//
//  Coordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 22/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
	
	var navigationController: UINavigationController {get set}
	var childCoordinators: [Coordinator] {get set}
	var parentCoordinator: Coordinator? {get set}
	
	func start()
	func add(childCoordinator coordinator: Coordinator)
	func remove(childCoordinator coordinator: Coordinator)
	func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
	func add(childCoordinator coordinator: Coordinator) {
		childCoordinators.append(coordinator)
	}
	
	func remove(childCoordinator coordinator: Coordinator) {
		childCoordinators = childCoordinators.filter({$0 !== coordinator})
	}
	
	func childDidFinish(_ child: Coordinator?) {
		if let child = child {
			remove(childCoordinator: child)
		} else {
			parentCoordinator?.childDidFinish(self)
		}
	}
}
