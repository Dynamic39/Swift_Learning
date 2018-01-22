//
//  ViewController.swift
//  01_BullsEye
//
//  Created by Samuel K on 2017. 12. 8..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

//Global Scope!
//var sample = 1

class ViewController: UIViewController {
    
    //현재 슬라이더 값을 담을 변수를 선언한다. default 값은 슬라이더의 초기 실행값과 동일하게 해준다.
    //Instance Scope
    var currentValue: Int = 0
    var targetValue:Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomLB: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue = lroundf(slider.value)
        startNewRound()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func updateValue(){
        randomLB.text = String(targetValue)
    }
    
    func startNewRound() {
        
        targetValue = Int(arc4random_uniform(100)) + 1
        currentValue = 50
        slider.value = Float(currentValue)
        updateValue()
        
    }
    
    //UISlider의 오브젝트를 받는 메서드를 구현한다.
    @IBAction func sliderMoved(_ slider:UISlider){
        
        print("The Value of Slider is now : \(slider.value)")
        currentValue = lroundf(slider.value)
        
        
    }
    
    //Action 기능을 구현하는 버튼은 만든다.
    @IBAction func showAlert() {
        
        //if else 문을 사용함
        //슬라이더의 값과, 타겟값의 차이를 찾아냄
        let difference: Int = abs(targetValue - currentValue)
        let points = 100 - difference
        
        
        //Local Scope
        let massage = "You scored \(points) points"
        
        let alert = UIAlertController(title: "Hello, World", message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()

    }

    
}

