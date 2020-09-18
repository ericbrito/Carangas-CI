//
//  CarViewModel.swift
//  Carangas
//
//  Created by Eric Alves Brito on 08/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

struct CarViewModel {
    
    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var title: String {
        car.name
    }
    
    var brand: String {
        "Marca: \(car.brand)"
    }
    
    var fuelType: String {
        "Combustível: \(car.fuel)"
    }
    
    var price: String {
        let price = Formatter.currencyFormatter.string(from: NSNumber(value: car.price)) ?? "R$ \(car.price)"
        return "Preço: \(price)"
    }
    
    func getCarFormViewModel() -> CarFormViewModel {
        CarFormViewModel(car: car)
    }
    
}
