//
//  CarAPIStub.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 04/11/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation
@testable import Carangas

class CarAPIStub: CarAPIProtocol {
	func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void) {
		
		let car1 = Car()
		car1.name = "Ford"
		car1.brand = "Ka"
		car1.gasType = 2
		car1.price = 50000
		car1._id = UUID().uuidString

		let car2 = Car()
		car2.name = "Corvette"
		car2.brand = "Chevrolet"
		car2.gasType = 1
		car2.price = 350000
		car2._id = UUID().uuidString

		let car3 = Car()
		car3.name = "City"
		car3.brand = "Honda"
		car3.gasType = 2
		car3.price = 75000
		car3._id = UUID().uuidString
		
		let cars = [car1, car2, car3]

		onComplete(.success(cars))
	}
	
	func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
		
	}
	
	func updateCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
		
	}
	
	func createCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
		
	}
	
	
}
