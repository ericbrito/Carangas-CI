//
//  CarViewControllerTests.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 04/11/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarViewControllerTests: XCTestCase {

	var sut: CarViewController!
	var car: Car {
		let car = Car()
		car.name = "Civic"
		car.brand = "Honda"
		car.price = 250000
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

	func test_Visualization_Of_Car() {
		//Given
		sut.viewModel = CarVisualizationViewModel(car: car)
		sut.loadView()
		
		//When
		sut.beginAppearanceTransition(true, animated: false)
		sut.endAppearanceTransition()
		
		//Then
		XCTAssertEqual(sut.title, "Civic", "Título da controller está errado")
		XCTAssertEqual(sut.lbBrand.text, "Marca: Honda")
		XCTAssertEqual(sut.lbPrice.text, "Preço: R$ 250.000,00")
		XCTAssertEqual(sut.lbGasType.text, "Combustível: Flex")
	}
}
