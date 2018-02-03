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
    
    var row0Item: ChecklistItem
    var row1Item: ChecklistItem
    var row2Item: ChecklistItem
    var row3Item: ChecklistItem
    var row4Item: ChecklistItem
    
    //간단한 클래스를 만들어서 데이터를 가져온다.
    //데이터를 저장하기 위하여, NS코더를 사용했지만, 사용법은 다시한번 다루도록 한다.
    required init?(coder aDecoder: NSCoder) {
        
        row0Item = ChecklistItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        
        row1Item = ChecklistItem()
        row1Item.text = "Brush the teeth"
        row1Item.checked = false
        
        row2Item = ChecklistItem()
        row2Item.text = "Learn iOS develoment"
        row2Item.checked = false
        
        row3Item = ChecklistItem()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        
        row4Item = ChecklistItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        
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
        return 5
    }
    
    //셀이 선택되었을때, 작동하는 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //체크마크의 온/오프 기능을 넣는 코드를 구현한다.
        //하지만 셀 재사용으로 인해, 해당 코드는 재사용 되면서, 의도 되지 않은 곳에 체크박스가 걸려있는 경우가 있다.
        if let cell = tableView.cellForRow(at: indexPath) {
            //엑세서리가 활성화 되있지 않은 경우 활성화를 시켜주고 그렇지 않은 경우 비활성화를 시켜주는 코드를 구현한다.
            //하지만 하기와 같이 코드가 구성되면, 길기 때문에 중복되는 코드에 대해서 리팩토링을 진행한다.
        
            if indexPath.row == 0 {
                row0Item.checked = !row0Item.checked
            }
            if indexPath.row == 1 {
                row1Item.checked = !row1Item.checked
            }
            if indexPath.row == 2 {
                row2Item.checked = !row2Item.checked
            }
            if indexPath.row == 3 {
                row3Item.checked = !row3Item.checked
            }
            if indexPath.row == 4 {
                row4Item.checked = !row4Item.checked
            }
            configureCheckmark(for: cell, at: indexPath)
        }
        // 하이라이트 된 회색 음영을 없애는 코드를 작성하여 준다.
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        
        //label에 태그를 붙여서 해당 태그에 해당하는 레이블의 텍스트 값을 주기위한 코드를 작성해보자.
        let label = cell.viewWithTag(1000) as! UILabel
        //label.text = "Run a marathon"
        
        //특정 indexPath의 값에 따른 cell의 텍스트 값을 설정하여 보자.
        //        let indexPathModule = indexPath.row % 5
        //        if indexPathModule == 0  {
        //            label.text = "Walk the dog"
        //        } else if indexPathModule == 1 {
        //            label.text = "Brush my teeth"
        //        } else if indexPathModule == 2 {
        //            label.text = "Learn iOS develoment"
        //        } else if indexPathModule == 3 {
        //            label.text = "Soccer practice"
        //        } else if indexPathModule == 4 {
        //            label.text = "Eat icecream"
        //        }
        
        //간단한 데이터를 가져오는 코드로 변경해보도록 하자.
        
        if indexPath.row == 0 {
            label.text = row0Item.text
        } else if indexPath.row == 1 {
            label.text = row1Item.text
        } else if indexPath.row == 2 {
            label.text = row2Item.text
        } else if indexPath.row == 3 {
            label.text = row3Item.text
        } else if indexPath.row == 4 {
            label.text = row4Item.text
        }
        
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    //체크박스가 활성화되어있는 상태에서는 최초의 체크값 변수를 가져오지 못하기 때문에, TableView가 생성이 될때, 체크해주는 메서드를 작성해주어야 정상작동이 가능하다.
    //혹은, 엑세서리 체크박스를 처음부터 비활성화를 스탠다드로 하여 사용을 하면 가능하다.
    func configureCheckmark(for cell:UITableViewCell, at indexPath: IndexPath) {
        
        var isChecked = false
        
        if indexPath.row == 0 {

            isChecked = row0Item.checked
        } else if indexPath.row == 1 {
            isChecked = row1Item.checked
        } else if indexPath.row == 2 {
            isChecked = row2Item.checked
        } else if indexPath.row == 3 {
            isChecked = row3Item.checked
        } else if indexPath.row == 4 {
            isChecked = row4Item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
}

