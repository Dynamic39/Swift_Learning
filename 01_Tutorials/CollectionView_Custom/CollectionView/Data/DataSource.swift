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

import UIKit

//Data를 가지는 DataModel을 만들어보자.
//Plist에서 데이터를 가져오는 메서드를 만들어보자.

class DataSource2 {
    
    //parkData를 가지고 오는 배열 변수를 선언한다.
    private var parks = [Park]()
    
    //parkData를 가지고 사용할 변환이 가능한 배열 변수를 선언한다.
    private var immutableParks = [Park]()

    //collectionView의 섹션이름을 가져올를 변수를 만든다.
    private var sections = [String]()

    //item수를 정하는 변수를 만든다(computed-property)
    private var count: Int {
        return parks.count
    }
    
    //section수를 정하는 변수를 만든다(computed-property)
    private var numberOfSections:Int {
        return sections.count
    }
    
    // MARK:- Public
    // 초기화를 진행한다.

    init() {
        //parks = loadParksFromDisk()
        //immutableParks = parks
    }
    
    // MARK:- Private
    // Plist에서 Data를 가져온 후, parkData 에 입력 후, 초기화한 각 데이터들을 집어넣어 준다.
    private func loadParksFromDisk() -> [Park] {
        //Plist에서 데이터를 가져온다.
        if let path = Bundle.main.path(forResource: "NationalParks", ofType: "plist") {
            //NSArray를 사용하여, 데이터를 가지오 온다. Plist -> NSArray형태로 변환이 된다.
            if let dicArray = NSArray(contentsOfFile: path) {
                //plist를 받을 새로운 변수를 설정하낟.
                var nationalParks:[Park] = []
                //for 문을 실행하여 하나씩 배열을 풀어줌과 동시에 데이터를 입력하여 준다.
                for item in dicArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let state = dict["state"] as! String
                        let date = dict["date"] as! String
                        let photo = dict["photo"] as! String
                        let index = dict["index"] as! Int
                        let park = Park(name: name, state: state, date: date, photo: photo, index: index)
                        
                        nationalParks.append(park)
                    }
                    
                }
                return nationalParks
            }
        }
        return []
    }
    
    //하나더
    private func loadParksFromDisk2() -> [Park] {
        
        if let path = Bundle.main.path(forResource: "NationalParks", ofType: "plist") {
            if let dicArray = NSArray(contentsOfFile: path) {
                var nationalParks:[Park] = []
                
                for item in dicArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let state = dict["state"] as! String
                        let date = dict["date"] as! String
                        let photo = dict["photo"] as! String
                        let index = dict["index"] as! Int
                        
                        let park = Park(name: name, state: state, date: date, photo: photo, index: index)
                        
                        nationalParks.append(park)
                    }
                }
                return nationalParks
            }
        }
        
        return []
    }
    
}



class DataSource {
    
	private var parks = [Park]()
	private var immutableParks = [Park]()

	private var sections = [String]()
	

	var count: Int {
		return parks.count
	}
	
	var numberOfSections: Int {
		return sections.count
        print("확인중", sections.count)
	}
	
	// MARK:- Public
	init() {
		parks = loadParksFromDisk()
		immutableParks = parks
	}
    
    // MARK:- Private
    private func loadParksFromDisk() -> [Park] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "NationalParks", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var nationalParks: [Park] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let state = dict["state"] as! String
                        let date = dict["date"] as! String
                        let photo = dict["photo"] as! String
                        let index = dict["index"] as! Int
                        let park = Park(name: name, state: state, date: date, photo: photo, index: index)
                        if !sections.contains(state) {
                            sections.append(state)
                        }
                        nationalParks.append(park)
                    }
                }
                return nationalParks
            }
        }
        return []
    }
	
    //---------------- 여기까지 작성 ------------------//
	func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
		var indexes = [Int]()
		for indexPath in indexPaths {
			indexes.append(absoluteIndexForIndexPath(indexPath))
		}
		var newParks = [Park]()
		for (index, park) in parks.enumerated() {
			if !indexes.contains(index) {
				newParks.append(park)
			}
		}
		parks = newParks
	}
	
	func moveParkAtIndexPath(_ indexPath: IndexPath, toIndexPath newIndexPath: IndexPath) {
		if indexPath == newIndexPath {
			return
		}
		let index = absoluteIndexForIndexPath(indexPath)
		let nationalPark = parks[index]
		nationalPark.state = sections[newIndexPath.section]
		let newIndex = absoluteIndexForIndexPath(newIndexPath)
		parks.remove(at: index)
		parks.insert(nationalPark, at: newIndex)
	}
	
	func newRandomPark() -> IndexPath {
		let index = Int(arc4random_uniform(UInt32(immutableParks.count)))
		let parkToCopy = immutableParks[index]
		let newPark = Park(copying: parkToCopy)
		parks.append(newPark)
		return IndexPath(row: parks.count - 1, section: 0)
	}
	
	func indexPathForNewRandomPark() -> IndexPath {
		let index = Int(arc4random_uniform(UInt32(immutableParks.count)))
		let parkToCopy = immutableParks[index]
		let newPark = Park(copying: parkToCopy)
        
		parks.append(newPark)
		parks.sort { $0.index < $1.index }
		return indexPathForPark(newPark)
	}
	
	func indexPathForPark(_ park: Park) -> IndexPath {
		let section = sections.index(of: park.state)!
		var item = 0
		for (index, currentPark) in parksForSection(section).enumerated() {
			if currentPark === park {
				item = index
				break
			}
		}
		return IndexPath(item: item, section: section)
	}
	
	func numberOfParksInSection(_ index: Int) -> Int {
		let nationalParks = parksForSection(index)
		return nationalParks.count
	}
	
	func parkForItemAtIndexPath(_ indexPath: IndexPath) -> Park? {
		if indexPath.section > 0 {
			let nationalParks = parksForSection(indexPath.section)
			return nationalParks[indexPath.item]
            
		} else {
			return parks[indexPath.item]
		}
	}
	
	func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
		if indexPath.section < sections.count {
			return sections[indexPath.section]
		}
		return nil
	}
    
	private func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
		var index = 0
		for i in 0..<indexPath.section {
			index += numberOfParksInSection(i)
		}
		index += indexPath.item
		return index
	}
	
	private func parksForSection(_ index: Int) -> [Park] {
		let section = sections[index]
		let parksInSection = parks.filter { (park: Park) -> Bool in
			return park.state == section
		}
		return parksInSection
	}
}
