//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 22/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

class CarsListingCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewController = CarsTableViewController.instantiateFromStoryboard(.listing)
		viewController.coordinator = self
		navigationController.pushViewController(viewController, animated: false)
	}
}

extension CarsListingCoordinator: CarCreator {
	func createCar() {
		let childCoordinator = FormCoordinator(navigationController: navigationController)
		childCoordinator.parentCoordinator = self
		add(childCoordinator: childCoordinator)
		childCoordinator.start()
	}
}

extension CarsListingCoordinator: CarPresenter {
	func showCarWith(viewModel: CarVisualizationViewModel) {
		let childCoordinator = CarVisualizationCoordinator(navigationController: navigationController,
														   viewModel: viewModel)
		childCoordinator.parentCoordinator = self
		add(childCoordinator: childCoordinator)
		childCoordinator.start()
	}
}
