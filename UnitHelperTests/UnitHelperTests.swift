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
  
  func testViewPrint() {
    let contentView = UIView()
    contentView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    contentView.backgroundColor = .red
    
    let topContainer = UIView()
    topContainer.backgroundColor = .blue
    topContainer.frame = CGRect(x: 20, y: 20, width: 380, height: 100)
    contentView.addSubview(topContainer)
    
    let view1 = UIButton()
    view1.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
    topContainer.addSubview(view1)
    let view2 = UILabel()
    view2.textColor = .orange
    view2.text = "label"
    view2.frame = CGRect(x: 40, y: 20, width: 77777770, height: 40)
    topContainer.addSubview(view2)
    
    let bottomContainer = UIView()
    bottomContainer.backgroundColor = .blue
    bottomContainer.frame = CGRect(x: 20, y: 320, width: 380, height: 100)
    contentView.addSubview(bottomContainer)
    
    let view3 = UIImageView()
    view3.frame = CGRect(x:80, y: 20, width: 40, height: 40)
    bottomContainer.addSubview(view3)
    
    print(contentView.treeDescription())
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
