//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 22/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

class CarVisualizationCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	var carVisualizationViewModel: CarVisualizationViewModel
	
	init(navigationController: UINavigationController, viewModel: CarVisualizationViewModel) {
		self.navigationController = navigationController
		self.carVisualizationViewModel = viewModel
	}
	
	func start() {
		let viewController = CarViewController.instantiateFromStoryboard(.visualization)
		viewController.viewModel = carVisualizationViewModel
		viewController.coordinator = self
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func editCarWith(viewModel: CarFormViewModel) {
		let childCoordinator = FormCoordinator(navigationController: navigationController,
											   viewModel: viewModel)
		childCoordinator.parentCoordinator = self
		add(childCoordinator: childCoordinator)
		childCoordinator.start()
	}
	
	deinit {
		print("CarVisualizationCoordinator deinit")
	}
}
