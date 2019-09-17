//
//  ViewPrintable.swift
//  UnitHelper
//
//  Created by tsuf on 2019/9/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import UIKit

protocol ViewPrintable {
  func treeDescription(_ level: Int) -> String
}

extension UIView: ViewPrintable {
  func treeDescription(_ level: Int = 0) -> String {
    var res = ""
    var indentation = ""
    for _ in 0..<level {
      indentation += " →"
    }
    res += indentation
    res += self.description
    for subview in subviews {
      res += "\n"
      res += subview.treeDescription(level + 1)
    }
    return res
  }
}
