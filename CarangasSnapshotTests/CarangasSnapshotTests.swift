//
//  CarangasSnapshotTests.swift
//  CarangasSnapshotTests
//
//  Created by Alves Brito, Eric(AWF) on 04/11/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import Carangas

class CarangasSnapshotTests: FBSnapshotTestCase {

	var sut: CarViewController!
	var car: Car {
		let car = Car()
		car.name = "Civic"
		car.brand = "Honda"
		car.price = 250000
		car.gasType = 0
		return car
	}
	
    override func setUp() {
		super.setUp()
		
		recordMode = false
		fileNameOptions = [.device, .screenSize, .OS]
		
		sut = CarViewController.instantiateFromStoryboard(.visualization)
    }

    override func tearDown() {
        sut = nil
		super.tearDown()
    }


	func test_CarViewController_Snapshot() {
		sut.viewModel = CarVisualizationViewModel(car: car)
		sut.loadView()
		
		sut.beginAppearanceTransition(true, animated: false)
		sut.endAppearanceTransition()
		
		FBSnapshotVerifyView(sut.view)
		
	}

}
