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
    var currentValue = 0
    var targetValue = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomLB: UILabel!
    @IBOutlet weak var scoreLB: UILabel!
    var score = 0 // 해당 변수의 경우 Int Type으로 추론이 가능해진다.
    var round = 0
    @IBOutlet weak var roundLB: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //슬라이더의 UI를 코드로 작성하여 준다.
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // UIImage(named: "SlideThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") // UIImage(named: "SlideThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        //인셋을 설정한다.
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft") // UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight") // UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

        currentValue = lroundf(slider.value)
        startNewGame()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    
    func updateValue(){
        randomLB.text = String(targetValue)
        scoreLB.text = String(score)
        roundLB.text = String(round)
    }
    
    func startNewRound() {
        
        round += 1
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
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "not even close.."
        }
        
        score += points
        
        //Local Scope
        let massage = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        
        // 간단한 클로저 실행
        // UIAlert의 경우, handler에 다음 행동을 넣게 되면, 해당 액션이 실행된 후, 다음 명령이 실행된다. 해당 형태를 클로져라고 한다.
        // 클로져는 여러 형태가 있으나, {} 기호를 삽입하여, 클로져를 실행 할 수 있도록 해준다.
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            //메서드 내에서 실행이므로 self를 기재하여 준다
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        

    }

    
}

