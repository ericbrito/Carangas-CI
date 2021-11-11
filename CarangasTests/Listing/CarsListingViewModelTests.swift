//
//  CarsListingViewModelTests.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 04/11/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {

	var sut: CarsListingViewModel!
	
    override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CarsListingViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
		try super.tearDownWithError()
    }

	func testCount() {
		//Given
		sut.service = CarAPIStub()
		
		//When
		sut.loadCars {_ in}
		
		//Then
		XCTAssertEqual(sut.numberOfRows, 3, "Total de carros diferente do esperado")
	}

	func test_First_Car_Info_On_CarCellViewModel() {
		//Given
		sut.service = CarAPIStub()
		sut.loadCars { _ in}
		let indexPath = IndexPath(row: 0, section: 0)
		
		//When
		let carViewModel = sut.getCarVisualizationViewModelFor(indexPath)
		
		//Then
		XCTAssertTrue(carViewModel.title == "Ford", "Nome do carro errado")
		XCTAssertEqual(carViewModel.brand, "Marca: Ka", "Nome da marca errada")
	}

}
