//
//  CarCellViewModel.swift
//  Carangas
//
//  Created by Eric Alves Brito on 08/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

//https://developer.apple.com/videos/play/wwdc2015/408/
struct CarCellViewModel: VehicleCellProtocol {
    
    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var name: String {
        car.name
    }
    
    var brand: String {
        car.brand.uppercased()
    }
    
}
