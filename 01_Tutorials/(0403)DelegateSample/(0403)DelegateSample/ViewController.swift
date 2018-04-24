//
//  ViewController.swift
//  (0403)DelegateSample
//
//  Created by Samuel K on 2018. 4. 3..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var samplePrint: PrintClass?
  
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

extension ViewController: PrintDelegate {
  func print1() {
    print("1번이 선택되었어요 ㅎㅎ")
  }
  
  func print2() {
    print("2번이 선택되었어요 !")
  }
  
  
}

