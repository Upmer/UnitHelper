//
//  UnitHelperUITests.swift
//  UnitHelperUITests
//
//  Created by tsuf on 2019/9/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class UnitHelperUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
      let app = XCUIApplication()
      XCUIElement
      print(app.children(matching: .window).allElementsBoundByIndex)
//      let labelStaticText = app.staticTexts["label"]
//      labelStaticText.tap()
//      labelStaticText.tap()
//      labelStaticText.tap()
//      labelStaticText.tap()
//      app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
      
//      print(element.debugDescription)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
