//
//  CarViewControllerTests.swift
//  CarangasTests
//
//  Created by Eric Alves Brito on 17/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarViewControllerTests: XCTestCase {

    var sut: CarViewController!
    var car: Car {
        let car = Car()
        car.name = "Civic"
        car.brand = "Honda"
        car.price = 25000.00
        car.gasType = 0
        return car
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CarViewController.instantiateFromStoryboard(.visualization)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testVisualizationOfCar() {
        //Given
        sut.viewModel = CarViewModel(car: car)
        sut.loadView()
        
        //When
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        //Then
        XCTAssertEqual(sut.title, "Civic", "Título da controller errado")
        XCTAssertEqual(sut.lbBrand.text, "Marca: Honda")
        XCTAssertEqual(sut.lbPrice.text, "Preço: R$ 25.000,00")
        XCTAssertEqual(sut.lbGasType.text, "Combustível: Flex")
    }

}
