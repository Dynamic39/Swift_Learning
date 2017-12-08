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
//: ## Chapter 12: Methods
var numbers = [1, 2, 3]
numbers.removeLast()
numbers

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
  var month: String
  var day: Int
  
  func monthsUntilWinterBreak() -> Int {
    return months.index(of: "December")! - months.index(of: month)!
  }
  
  mutating func advance() {
    day += 1
  }
}

extension SimpleDate {
  init() {
    month = "January"
    day = 1
  }
}

let date = SimpleDate()
date.month
date.monthsUntilWinterBreak()

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day

struct Math {
  static func factorial(of number: Int) -> Int {
    return (1...number).reduce(1, *)
  }
}

Math.factorial(of: 6)

extension Math {
  static func primeFactors(of value: Int) -> [Int] {
    var remainingValue = value
    var testFactor = 2
    var primes: [Int] = []
    while testFactor * testFactor <= remainingValue {
      if remainingValue % testFactor == 0 {
        primes.append(testFactor)
        remainingValue /= testFactor
      }
      else {
        testFactor += 1
      }
    }
    if remainingValue > 1 {
      primes.append(remainingValue)
    }
    return primes
  }
}

Math.primeFactors(of: 81)
