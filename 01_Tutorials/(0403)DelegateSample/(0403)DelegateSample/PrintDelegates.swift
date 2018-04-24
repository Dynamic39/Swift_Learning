//
//  PrintDelegates.swift
//  (0403)DelegateSample
//
//  Created by Samuel K on 2018. 4. 3..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import Foundation

protocol PrintDelegate : class {
  
  func print1()
  func print2()
  
}

class PrintClass {
  
  var delegate: PrintDelegate?
  
  func samplePrint1() {
    delegate?.print1()
  }
  
  func samplePrint2() {
    delegate?.print2()
  }
}
