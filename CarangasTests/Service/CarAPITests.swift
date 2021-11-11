//
//  CarAPITests.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 04/11/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarAPITests: XCTestCase {

	private var sut: CarAPI!
	
    override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CarAPI()
    }

    override func tearDownWithError() throws {
        sut = nil
		try super.tearDownWithError()
    }

//	func test_Load_Cars_Response_Success() {
//		
//		let promise = expectation(description: "Sucesso")
//		
//		sut.loadCars { result in
//			switch result {
//				case .success:
//					XCTAssert(true)
//				case .failure(let apiError):
//					XCTFail(apiError.errorMessage)
//			}
//			promise.fulfill()
//		}
//		
//		wait(for: [promise], timeout: 5.0)
//	}
	

}
