//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Samuel K on 2018. 2. 5..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

//
protocol AddItemViewControllerDelegate: class {
    
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
    
}

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {
    
    //텍스트 필드를 등록한다.
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    //델리게이트 선언부, 옵셔널 타입으로 진행 하고, weak 형식으로 진행해서 강한 참조가 걸리지 않게 한다.
    weak var delegate: AddItemViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //처음 테스트 필드에 키보드를 보여주는 역할을 한다.
        textField.becomeFirstResponder()
    }
    
    
    //키보드의 리턴키를 터치하면, 키보드가 내려가도록 구현한다.
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return false
//    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    @IBAction func cencel(){
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
        
    }
    
    @IBAction func done(){
        
        //해당 메서드를 실행시키기 위해, 텍스트 필드의 키보드의 이벤트 액션을 해당 메서드와 연동을 하게 되면, 키보드가 내려가면서, 데이터가 저장, dismiss 되는 효과를 가져올 수 있다.
        
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        
        delegate?.addItemViewController(self, didFinishAdding: item)

    }
    
    //NSRange를 이용한, 텍스트 필드 키보드 가리기 및 doneButton 활성화 제어
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //텍스트 필드를 지정한다.
        let oldText = textField.text!
        //NSRange안에 oldText값을 적용한다.
        let stringRange = Range(range, in:oldText)
        //변수를 하나 더 생성하여, 기존값과 새로운 값이 차이가 있는지 확인하는 코드를 구현한다.
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        
        //새로운 텍스트가 존재하지 않는 경우, done button을 비활성화 시킨다.
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
}
