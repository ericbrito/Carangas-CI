//
//  FormCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 22/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

class FormCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	var carFormViewModel: CarFormViewModel
	
	init(navigationController: UINavigationController, viewModel: CarFormViewModel = CarFormViewModel()) {
		self.navigationController = navigationController
		self.carFormViewModel = viewModel
	}
	
	func start() {
		let viewController = CarFormViewController.instantiateFromStoryboard(.form)
		viewController.viewModel = carFormViewModel
		viewController.coordinator = self
		navigationController.pushViewController(viewController, animated: true)
	}
	
	deinit {
		print("FormCoordinator deinit")
	}
}

