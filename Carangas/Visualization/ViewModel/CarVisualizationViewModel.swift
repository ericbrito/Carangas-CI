//
//  CarVisualizationViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation

class CarVisualizationViewModel {
	private var car: Car
	let numberFormatter: NumberFormatter = {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .currency
		numberFormatter.locale = Locale(identifier: "pt_BR")
		return numberFormatter
	}()
	
	var title: String {
		car.name
	}
	
	var brand: String {
		"Marca: \(car.brand)"
	}
	
	var gasType: String {
		"Combustível: \(car.fuel)"
	}
	
	var price: String {
		let price = numberFormatter.string(from: NSNumber(value: car.price)) ?? "R$ \(car.price)"
		return "Preço: \(price)"
	}
	
	init(car: Car) {
		self.car = car
	}
	
	func getCarFormViewModel() -> CarFormViewModel {
		CarFormViewModel(car: car)
	}
	
	deinit {
		print("CarVisualizationViewModel deinit")
	}
}
