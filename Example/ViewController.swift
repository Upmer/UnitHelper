//
//  ViewController.swift
//  UnitHelper
//
//  Created by tsuf on 2019/9/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let contentView = UIView()
    contentView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    contentView.backgroundColor = .red
    view.addSubview(contentView)
    
    let topContainer = UIView()
    topContainer.backgroundColor = .blue
    topContainer.frame = CGRect(x: 20, y: 20, width: 380, height: 100)
    contentView.addSubview(topContainer)
    
    let view1 = UIButton()
    view1.setTitle("button", for: .normal)
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
  }
}

