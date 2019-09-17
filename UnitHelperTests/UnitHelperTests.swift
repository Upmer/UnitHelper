//
//  UnitHelperTests.swift
//  UnitHelperTests
//
//  Created by tsuf on 2019/9/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest
@testable import UnitHelper

class UnitHelperTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testLoggerMachine() {
    XCTContext.runActivity(named: "test normal text") { _ in
      let file = "test_text"
      LoggerMachine.rewrite(message: "111", to: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "111")
      LoggerMachine.rewrite(message: "1111", to: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "1111")
      LoggerMachine.write(message: "2222", to: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "1111\n2222")
      LoggerMachine.write(message: "3333", to: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "1111\n2222\n3333")
      LoggerMachine.clear(file: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "")
    }
    XCTContext.runActivity(named: "test emoji text") { _ in
      let file = "test_emoji"
      LoggerMachine.rewrite(message: "😝️", to: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "😝️")
      LoggerMachine.write(message: "😁", to: file)
      XCTAssertEqual(LoggerMachine.read(at: file), "😝️\n😁")
      LoggerMachine.clear(file: file)
    }
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
