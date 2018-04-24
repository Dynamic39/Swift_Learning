//
//  ViewController2.swift
//  (0403)DelegateSample
//
//  Created by Samuel K on 2018. 4. 3..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

  var samplePrint : PrintClass?
    override func viewDidLoad() {
        super.viewDidLoad()
      samplePrint = PrintClass()
      samplePrint?.delegate = self
      
    }
  
  @IBAction func btn1(_ sender: Any) {
    samplePrint?.samplePrint1()
  }
  
  @IBAction func btn2(_ sender: Any) {
    samplePrint?.samplePrint2()
  }
  
  
}

extension ViewController2: PrintDelegate {
  func print1() {
    print("엥 이상하당")
  }
  
  func print2() {
    print("뒤로 갑니다!")
    dismiss(animated: true, completion: nil)
  }
  
  
}
