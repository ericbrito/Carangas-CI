//
//  CarFormViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation

protocol CarFormViewModelDelegate: AnyObject {
	func onCarCreated(result: Result<Void, APIError>)
	func onCarUpdated(result: Result<Void, APIError>)
}

class CarFormViewModel {
	
	private let car: Car
	private var service = CarAPI()
	weak var delegate: CarFormViewModelDelegate?
	
	private var isEditing: Bool {
		car._id != nil
	}
	
	var name: String {
		car.name
	}
	
	var brand: String {
		car.brand
	}
	
	var title: String {
		isEditing ? "Alteração" : "Cadastro"
	}
	
	var buttonTitle: String {
		isEditing ? "Alterar carro" : "Cadastrar carro"
	}
	
	var gastypeIndex: Int {
		car.gasType
	}
	
	var price: String {
		"\(car.price)"
	}
	
	init(car: Car? = nil) {
		self.car = car ?? Car()
	}
	
	func saveCar(name: String, brand: String, gastypeIndex: Int, price: String) {
		car.brand = brand
		car.name = name
		car.gasType = gastypeIndex
		car.price = Int(price) ?? 0
		
		if isEditing {
			service.updateCar(car) { [weak self] (result) in
				self?.delegate?.onCarUpdated(result: result)
			}
		} else {
			service.createCar(car) { [weak self] (result) in
				self?.delegate?.onCarCreated(result: result)
			}
		}
	}
	
	deinit {
		print("CarFormViewModel deinit")
	}
}
