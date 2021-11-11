//
//  CarsListingViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation

class CarsListingViewModel {
	
	// MARK: - Properties
	private var cars: [Car] = []
	var service: CarAPIProtocol
	
	var numberOfRows: Int {
		cars.count
	}
	
	init(service: CarAPIProtocol = CarAPI()) {
		self.service = service
	}
	
	// MARK: - Methods
	func cellViewModelFor(_ indexPath: IndexPath) -> CarCellViewModel {
		let car = cars[indexPath.row]
		return CarCellViewModel(car: car)
	}
	
	func loadCars(onComplete: @escaping (Result<Void, APIError>) -> Void) {
		service.loadCars { [weak self] (result) in
			guard let self = self else {return}
			switch result {
			case .success(let cars):
				self.cars = cars
				onComplete(.success(()))
			case .failure(let apiError):
				onComplete(.failure(apiError))
			}
		}
	}
	
	func deleteCar(at indexPath: IndexPath, onComplete: @escaping (Result<Void, APIError>) -> Void) {
		let car = cars[indexPath.row]
		service.deleteCar(car) { [weak self] (result) in
			switch result {
			case .success:
				self?.cars.remove(at: indexPath.row)
				onComplete(.success(()))
			case .failure(let apiError):
				onComplete(.failure(apiError))
			}
		}
	}
	
	func getCarVisualizationViewModelFor(_ indexPath: IndexPath) -> CarVisualizationViewModel {
		CarVisualizationViewModel(car: cars[indexPath.row])
	}
}
