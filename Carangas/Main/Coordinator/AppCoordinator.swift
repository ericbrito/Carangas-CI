//
//  AppCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 22/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	
	init() {
		navigationController = UINavigationController()
		navigationController.navigationBar.prefersLargeTitles = true
		navigationController.navigationBar.tintColor = UIColor(named: "main")
	}
	
	func start() {
		let childCoordinator = CarsListingCoordinator(navigationController: navigationController)
		childCoordinator.parentCoordinator = self
		add(childCoordinator: childCoordinator)
		childCoordinator.start()
	}
	
	
}
