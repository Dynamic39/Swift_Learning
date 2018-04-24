//
//  Park.swift
//  CollectionView_Repeat_Park
//
//  Created by Samuel K on 2018. 3. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

//Park의 클래스를 생성할 것
class Park {
  
  //name, state, date, photo, index 를 프로퍼티로 설정할것,(index 는 Int 나머지는 String)
  var name:String
  var state:String
  var date: String
  var photo:String
  var index: Int
  
  
  //초기화 값은 각각의 이름을 가지는 것으로 설정할것.(Default init)
  init(name:String, state:String, date:String, photo:String, index:Int) {
    self.name = name
    self.state = state
    self.date = date
    self.photo = photo
    self.index = index
  }
  
  
  //convenience init은 자신의 클래스를 가지는 파라미터를 설정하여 진행하여 줄것.
  //convenience init에 대한 추가 설명을 확인하여, 주석 처리 할것.
  //이미 가지고 있는 데이터를 추가로 생성하지 않고, 그대로 가져오기 위하여, 편의 초기화를 진행한다.
  //이로인해, 기존의 변수값을 한번더 가져오는 것이 아닌, 이미 만들어진 DataModel에서 그 값을 가져와서 초기화를 진행할 수 있다.
  
    //convenience init 후엔, Default init도 같이 실행하여 주어서 초기화가 정상적으로 처리 될 수 있도록 지원한다.
  
  convenience init(copying park:Park) {
    
    self.init(name: park.name, state: park.state, date: park.date, photo: park.photo, index: park.index)
    
  }
  
}



















