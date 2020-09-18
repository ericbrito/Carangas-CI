//
//  AppCoordinator.swift
//  Carangas
//
//  Created by Eric Alves Brito on 09/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

//https://gist.github.com/simme/ea0918d534f13ace3445e84ec043ed99
//https://uptech.team/blog/mvvm-coordinators-and-rxswift
//https://medium.com/@dkw5877/flow-coordinators-333ed64f3dd
//https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
//https://medium.com/better-programming/reactive-mvvm-and-the-coordinator-pattern-done-right-88248baf8ca5

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
        let childCoordinator = CarsCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    func showModal(coordinator: Coordinator) {
        navigationController.present(coordinator.navigationController, animated: true, completion: nil)
    }
}
