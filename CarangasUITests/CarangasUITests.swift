//
//  CarangasUITests.swift
//  CarangasUITests
//
//  Created by Alves Brito, Eric(AWF) on 04/11/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import XCTest

class CarangasUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//
//		let app = XCUIApplication()
//		app.launch()
//
//		let cell = app.tables["carsListTable"].cells.firstMatch
//		XCTAssertTrue(cell.waitForExistence(timeout: 5.0))
//
//		var cellTitleLabelText = cell.staticTexts["carCellTitle"].label
//		cellTitleLabelText = cellTitleLabelText.map({
//			if $0 != cellTitleLabelText.first! {
//				return $0.lowercased()
//			} else {
//				return "\($0)"
//			}
//		}).joined()
//
//
//		XCTAssertFalse(cellTitleLabelText.isEmpty)
//
//		cell.tap()
//
//		XCTAssertTrue(app.navigationBars[cellTitleLabelText].exists, "Tela errada")
//
//    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
