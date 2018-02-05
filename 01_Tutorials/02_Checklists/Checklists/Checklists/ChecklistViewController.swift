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
//새롭게 만든 딜리게이트를 선언하여 가지고 온다.
class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    //AddItemViewControllerDelegate 안에 있는 메서드를 시행하여 사용하여 준다.
    //딜리게이트에서 선언한 부분은 어떻게 실행할것인지 위임한 것이기 때문에, 컨트롤러 부분에서 해당 기능을 담당하여 준다.
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        //딜리게이트에서 받은 부분을 어떻게 처리할 것인지 기재하여 준다.
        navigationController?.popViewController(animated: true)
        print("delegate 실행 (1)!")
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem) {
        
        print("delegate 실행 (2)!")
        
        //새로운 row가 생기면 추가로 생성이 되므로 카운트를 먼져 계산하여 준다.
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    //배열을 만들어서 아이템이 유동적으로 움직일 수 있도록 하여준다.
    var items: [ChecklistItem]
    
    //UI로 아이템을 추가하는 액션 메서드를 만들어 준다.
    @IBAction func addItem(_ sender: Any) {
        print("added item")

        //실제로 추가 할때마다 새로운 row가 생성되는 코드를 만들어주자.
        //마지막 열에 넣기 위해, 마지막 카운트가 몇인지 확인한다.
        let newRowIndex = items.count
        //새로운 인스턴스 생성
        let item = ChecklistItem()
        // item.text = "I am a new row"
        
        //랜덤 어레이를 가져와서 텍스트에 넣어주는 작업을 진행해보자
        var titles = ["Empty todo item", "Generic todo", "First todo: fill me out", "I need somthig to do", "Much todo about nothing"]
        //랜덤 넘버를 생성한다.
        let randomNumber = arc4random_uniform(UInt32(titles.count))
        let title = titles[Int(randomNumber)]
        
        item.checked = true
        item.text = title
        
        //생성된 인스턴스를 items 배열에 저장한다.
        items.append(item)
        
        //테이블 뷰에 넣기위한 코드를 작성한다.
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)

    }
    
    //간단한 클래스를 만들어서 데이터를 가져온다.
    //데이터를 저장하기 위하여, NS코더를 사용했지만, 사용법은 다시한번 다루도록 한다.
    required init?(coder aDecoder: NSCoder) {
        
        items = [ChecklistItem]()
        
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
    
    //데이터를 추가하는 곳과, 데이터를 수정하는 곳 두개를 한번에 만들 수 있다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
            print("delegate 시작!")
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
            //유저가 탭한 곳이 어느 값인지 확인해야 한다.
            //sender를 indexPath로 변환하여 준다.
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 컨트롤러 타이틀을 라지 타입으로 변경하기(코드로)
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    //테이블뷰에 있는 아이템을 삭제하는 메서드를 구현하여 보자.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //삭제해야할 row를 설정한다.
        items.remove(at: indexPath.row)
        
        //재설정할 indexPath를 설정한다
//        let indexPaths = [indexPath]
//        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        //데이터에 따라서 자동으로 업데이트되는 MVC패턴이므로, 자료 자체를 다시 리로드 해와도 된다.
        tableView.reloadData()
    
        
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
        
        //커스텀으로 만든 레이블을 지정하여 준다.
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

