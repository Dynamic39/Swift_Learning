//
//  DataSource.swift
//  CollectionView_Repeat_Park
//
//  Created by Samuel K on 2018. 3. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import Foundation


class DataSource {
  
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
  private var numberOfSections: Int {
    return sections.count
  }
  // MARK:- Public
  // 초기화를 진행한다.
  
    init() {
      parks = loadParksFromDisk()
      immutableParks = parks
    }
  
  //Plist로딩용
  func loadParksFromDisk() -> [Park] {
    //FilePath 호출
    if let path = Bundle.main.path(forResource: "NationalParks", ofType: "plist") {
      //NSArray로 변환함
      if let dicArray = NSArray(contentsOfFile: path) {
        //plist를 받을 함수를 새로 생성한다. 타입은 [park]
        var nationalParks:[Park] = []
        //for 문 실행하여 각 인스턴스에 값을 넣어준다.
        for item in dicArray {
          //어레이 안에 있는 값을 딕셔너리로 전환하여 준다.
          if let dict = item as? NSDictionary {
            
            let name = dict["name"] as! String
            let state = dict["state"] as! String
            let date = dict["date"] as! String
            let photo = dict["photo"] as! String
            let index = dict["index"] as! Int
            let park = Park(name: name, state: state, date: date, photo: photo, index: index)
            
            //섹션별로 구분을 짓기 위해서 데이터를 가지고 온다.
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
  
  //2. IndexPath를 기준으로, 절대 Index 전체 값을 가지고 온다.
  private func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
    var index = 0
    //
    
  }
  
  //1. 각 섹션에 일치하는 파크들만을 가지고 오는 메서드를 작성한다.
  private func parksForSection(_ index: Int) -> [Park] {
    //해당 인덱스에 해당하는 섹션을 가지고 온다.
    let section = sections[index]
    
    //필터 기능을 활용하여 섹션에 일치하는 파크 데이터들만 가지고 온다.
    let parksInSection = parks.filter { (park: Park) -> Bool in
      return park.state == section
    }
    return parksInSection
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

