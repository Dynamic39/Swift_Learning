

import UIKit

//Data를 가지는 DataModel을 만들어보자.
//Plist에서 데이터를 가져오는 메서드를 만들어보자.

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
  
  
  //10. 인덱스 패스의 아이템을 삭제한다.
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
    print("10번 메서드", parks)
	}
	
  //9. 인덱스 패스를 바꿔준다.
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
    
    print("9번 메서드", parks.remove(at: index))
    print("9번 메서드", parks.insert(nationalPark, at: newIndex))
    
	}
	
  //8. 랜덤 파크를 생성하여 진행한다.
	func newRandomPark() -> IndexPath {
		let index = Int(arc4random_uniform(UInt32(immutableParks.count)))
		let parkToCopy = immutableParks[index]
		let newPark = Park(copying: parkToCopy)
		parks.append(newPark)
    
    print("8번 메서드", IndexPath(row: parks.count - 1, section: 0))
		return IndexPath(row: parks.count - 1, section: 0)
	}
	
  //7. 새로운 랜덤 파크로 섞는다
	func indexPathForNewRandomPark() -> IndexPath {
		let index = Int(arc4random_uniform(UInt32(immutableParks.count)))
        print(index)
		let parkToCopy = immutableParks[index]
		let newPark = Park(copying: parkToCopy)
        
        //새롭게 복사한 인덱스를 가장 끝에 포함시켜준다.
		parks.append(newPark)
        //parks를 새로 정렬한다. 그래야 바로 뒤에 올 수 있기 때문,
		parks.sort { $0.index < $1.index }
        
    print("7번 메서드", indexPathForPark(newPark))
		return indexPathForPark(newPark)
    
        
	}
	
  //6. 해당 파크의 인덱스 패스를 확인한다.
	func indexPathForPark(_ park: Park) -> IndexPath {
		let section = sections.index(of: park.state)!
		var item = 0
		for (index, currentPark) in parksForSection(section).enumerated() {
			if currentPark === park {
				item = index
                print("테스트", currentPark, item)
				break
			}
		}
    print("6번 메서드", IndexPath(item: item, section: section))
		return IndexPath(item: item, section: section)
    
        
	}
	
  //2번 섹션별 파크 수
	func numberOfParksInSection(_ index: Int) -> Int {
		let nationalParks = parksForSection(index)
    
    print("2번 메서드", nationalParks.count)
		return nationalParks.count
	}
	
  //4번 메서드 IndexPath별,
	func parkForItemAtIndexPath(_ indexPath: IndexPath) -> Park? {
		if indexPath.section > 0 {
			let nationalParks = parksForSection(indexPath.section)
      
      print("4번 메서드", nationalParks[indexPath.item])
			return nationalParks[indexPath.item]
      
		} else {
			return parks[indexPath.item]
		}
	}
	
  //3번 메서드, IndexPath별 titleSection
  func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
		if indexPath.section < sections.count {
      
      print("3번 메서드", sections[indexPath.section])
			return sections[indexPath.section]
      
      
      
		}
		return nil
	}
  
  //5번 메서드 - IndexPath를 근거로한 절대 Index값(Int)
	private func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
		var index = 0
		for i in 0..<indexPath.section {
			index += numberOfParksInSection(i)
		}
		index += indexPath.item
    print("2번 메서드", index)
		return index
    
    
	}
	
  //1번 메서드 - 각 섹션별 파크의 세부 사항, 변환값은 park 배열중, state section값만을 가지고 온다.
	private func parksForSection(_ index: Int) -> [Park] {
		let section = sections[index]
    
    //필터 기능을 활용하여, 섹션에 일치하는 파크를 반환한다.
		let parksInSection = parks.filter { (park: Park) -> Bool in
			return park.state == section
		}
    
    print("1번 메서드", parksInSection)
		return parksInSection
    
	}
}
