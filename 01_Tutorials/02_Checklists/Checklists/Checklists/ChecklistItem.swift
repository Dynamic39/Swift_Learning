//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Samuel K on 2018. 2. 3..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import Foundation

//ViewController에 모여있는 데이터성 변수들을 현재 파일에 클래스로 만들어 관리한다.
//Model

class ChecklistItem{
    
    var text = ""
    var checked = false
    
    //데이터 내에서 확인해주는 것이기 때문에, 클래스 안에서 관리하여 어디서든 사용할 수 있도록 만들어준다.
    func toggleChecked() {
        checked = !checked
    }
    
}
