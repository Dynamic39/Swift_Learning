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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        <#code#>
//    }

    //기본적으로 테이블뷰를 사용하기 위해서 필수로 사용해야 하는 메서드가 있다. 하기 두개와 같다.
    //Protocol method - class 안에 있고, 실행해야하는 메서드를 가르킨다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        //label에 태그를 붙여서 해당 태그에 해당하는 레이블의 텍스트 값을 주기위한 코드를 작성해보자.
        let label = cell.viewWithTag(1000) as! UILabel
        //label.text = "Run a marathon"
        
        //특정 indexPath의 값에 따른 cell의 텍스트 값을 설정하여 보자.
        
        let indexPathModule = indexPath.row % 5
        if indexPathModule == 0  {
            label.text = "Walk the dog"
        } else if indexPathModule == 1 {
            label.text = "Brush my teeth"
        } else if indexPathModule == 2 {
            label.text = "Learn iOS develoment"
        } else if indexPathModule == 3 {
            label.text = "Soccer practice"
        } else if indexPathModule == 4 {
            label.text = "Eat icecream"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    


}

