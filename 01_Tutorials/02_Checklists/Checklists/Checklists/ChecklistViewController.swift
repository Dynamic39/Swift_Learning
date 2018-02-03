//
//  ViewController.swift
//  Checklists
//
//  Created by Samuel K on 2018. 2. 2..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

//기본적인 ViewController를 TableView컨트롤러로 바꿀수 있다.
//TableView의 경우, DataSource와, Delegate를 사용한다.
class ChecklistViewController: UITableViewController{
    
    //배열을 만들어서 아이템이 유동적으로 움직일 수 있도록 하여준다.
    var items = [ChecklistItem]()
    
    //간단한 클래스를 만들어서 데이터를 가져온다.
    //데이터를 저장하기 위하여, NS코더를 사용했지만, 사용법은 다시한번 다루도록 한다.
    required init?(coder aDecoder: NSCoder) {
        
        let row0Item = ChecklistItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        //배열에 등록하여 준다.
        items.append(row0Item)
        
        let row1Item = ChecklistItem()
        row1Item.text = "Brush the teeth"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = ChecklistItem()
        row2Item.text = "Learn iOS develoment"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = ChecklistItem()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = ChecklistItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        items.append(row4Item)
        
        //새로운 체크리스트를 추가해주기 위해선, 다음과 같이 작성을 하면, 다른 데이터를 추가할 필요 없이 추가가 가능해진다.
        let row5Item = ChecklistItem()
        row5Item.text = "Watch Game of Thrones"
        row5Item.checked = false
        items.append(row5Item)
        
        let row6Item = ChecklistItem()
        row6Item.text = "Read iOS Apprentice"
        row6Item.checked = true
        items.append(row6Item)
        
        let row7Item = ChecklistItem()
        row7Item.text = "Take a nap"
        row7Item.checked = false
        items.append(row7Item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //기본적으로 테이블뷰를 사용하기 위해서 필수로 사용해야 하는 메서드가 있다. 하기 두개와 같다.
    //Protocol method - class 안에 있고, 실행해야하는 메서드를 가르킨다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //아이템의 숫자로 테이블뷰의 row값을 줄수 있다.
        return items.count
    }
    //셀이 선택되었을때, 작동하는 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //체크마크의 온/오프 기능을 넣는 코드를 구현한다.
        //하지만 셀 재사용으로 인해, 해당 코드는 재사용 되면서, 의도 되지 않은 곳에 체크박스가 걸려있는 경우가 있다.
        if let cell = tableView.cellForRow(at: indexPath) {
            
            //엑세서리가 활성화 되있지 않은 경우 활성화를 시켜주고 그렇지 않은 경우 비활성화를 시켜주는 코드를 구현한다.
            //아이템 배열을 사용하기 위하여, 별도의 변수를 선언하여 준다.
            let item = items[indexPath.row]
            //해당 아이템에 배열에 접근하여 true/false 를 전환하여 준다. 그렇기 때문에 기존 사용되었던 if 문은 사용할 필요가 없어지게 된다.
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        
        // 하이라이트 된 회색 음영을 없애는 코드를 작성하여 준다.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        //간단한 데이터를 가져오는 코드로 변경해보도록 하자.
        let item = items[indexPath.row]
        configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        
        return cell
    }
    //기존에 메서드에서 가지고 있는 기능이 성격과 맞기 않기 때문에 따로 분할을 해서 가지고 온다.
    //스위프트 프로그래밍 시, 한 메서드당 하나의 기능이 들어가도록 코드를 구성하여 주는 것이 좋다.
    func configureText(for cell:UITableViewCell, with item: ChecklistItem) {
        //label에 태그를 붙여서 해당 태그에 해당하는 레이블의 텍스트 값을 주기위한 코드를 작성해보자.
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    //체크박스가 활성화되어있는 상태에서는 최초의 체크값 변수를 가져오지 못하기 때문에, TableView가 생성이 될때, 체크해주는 메서드를 작성해주어야 정상작동이 가능하다.
    //혹은, 엑세서리 체크박스를 처음부터 비활성화를 스탠다드로 하여 사용을 하면 가능하다.
    //코드 리팩토링을 위하여, 중복이 되어 있는 indexPath를 삭제하고, CheckilistItem을 사용한다.
    func configureCheckmark(for cell:UITableViewCell, with item: ChecklistItem ) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

