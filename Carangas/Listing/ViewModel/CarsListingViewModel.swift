//
//  CarsListingViewModel.swift
//  Carangas
//
//  Created by Eric Alves Brito on 08/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsListingViewModel {
    
    private var cars: [Car] = [] {
        didSet {
            carsDidUpdate?()
        }
    }
    
    var carsDidUpdate: (() -> Void)?
    var Service: CarAPIProtocol.Type = CarAPI.self
    
    var count: Int {
        cars.count
    }
    
    func loadCars() {
        Service.loadCars { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let cars):
                self.cars = cars
            case .failure:
                self.carsDidUpdate?()
            }
        }
    }
    
    private func getCar(at indexPath: IndexPath) -> Car {
        cars[indexPath.row]
    }
    
    func cellViewModelFor(indexPath: IndexPath) -> CarCellViewModel {
        CarCellViewModel(car: getCar(at: indexPath))
    }
    
    func deleteCar(at indexPath: IndexPath, onComplete: @escaping (Result<Void, APIError>)->Void) {
        let car = getCar(at: indexPath)
        CarAPI.deleteCar(car) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success:
                self.cars.remove(at: indexPath.row)
            case .failure:
                break
            }
            onComplete(result)
        }
    }
    
    func getCarViewModelFor(_ indexPath: IndexPath) -> CarViewModel {
        CarViewModel(car: getCar(at: indexPath))
    }
}
