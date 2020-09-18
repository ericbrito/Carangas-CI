//
//  CarCoordinator.swift
//  Carangas
//
//  Created by Eric Alves Brito on 09/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var carViewModel: CarViewModel
    
    init(navigationController: UINavigationController, carViewModel: CarViewModel) {
        self.navigationController = navigationController
        self.carViewModel = carViewModel
    }
    
    func start() {
        let viewController = CarViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = carViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func editCar(with viewModel: CarFormViewModel) {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController, carFormViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("CarCoordinator deinit")
    }
}


