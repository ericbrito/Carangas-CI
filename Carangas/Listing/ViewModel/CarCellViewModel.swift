//
//  CarCellViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation

struct CarCellViewModel: VehicleCellViewModelProtocol {
	private var car: Car
	
	init(car: Car) {
		self.car = car
	}
	
	var name: String {
		car.name.uppercased()
	}
	
	var brand: String {
		car.brand
	}
}


