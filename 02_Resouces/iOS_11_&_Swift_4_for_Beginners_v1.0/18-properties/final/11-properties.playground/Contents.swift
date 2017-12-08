/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

//: ## Chapter 11: Properties

struct Car {
  let make: String
  let color: String
}

struct Contact {
  var fullName: String
  let emailAddress: String
  var type = "Friend"
}

var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil",
                     type: "Friend")

let name = person.fullName // Grace Murray
let email = person.emailAddress // grace@navy.mil

person.fullName = "Grace Hopper"
let grace = person.fullName // Grace Hopper

//person.emailAddress = "grace@gmail.com" // Error!

struct TV {
  var height: Double
  var width: Double
  
  var diagonal: Int {
    get {
      let result = (height * height + width * width).squareRoot().rounded()
      return Int(result)
    }
    set {
      let ratioWidth = 16.0
      let ratioHeight = 9.0
      let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
      height = Double(newValue) * ratioHeight / ratioDiagonal
      width = height * ratioWidth / ratioHeight
    }
  }
}

var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal // 110

tv.width = tv.height
let diagonal = tv.diagonal

tv.diagonal = 70
let height = tv.height // 34.32...
let width = tv.width // 61.01...

struct Level {
  static var highestLevel = 1
  let id: Int
  var boss: String
  var unlocked: Bool {
    didSet {
      if unlocked && id > Level.highestLevel {
        Level.highestLevel = id
      }
    }
  }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

// Error: you can't access a type property on an instance
//let highestLevel = level3.highestLevel

let highestLevel = Level.highestLevel // 1

struct LightBulb {
  static let maxCurrent = 40
  var current = 0 {
    didSet {
      if current > LightBulb.maxCurrent {
        print("Current too high, falling back to previous setting.")
        current = oldValue
      }
    }
  }
}

var light = LightBulb()
light.current = 50
var current = light.current // 0
light.current = 40
current = light.current // 40

struct Circle {
  lazy var pi = {
    return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
  }()
  var radius = 0.0
  var circumference: Double {
    mutating get {
      return pi * radius * 2
    }
  }
  init(radius: Double) {
    self.radius = radius
  }
}

var circle = Circle(radius: 5) // got a circle, pi has not been run
let circumference = circle.circumference // 31.42
// also, pi now has a value
