//
//  ViewController.swift
//  FrameVsBounds
//
//  Created by Greg Heo on 2014-11-16.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //view를 구성한다.
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    //각각의 슬라이더를 구성한다.
    @IBOutlet weak var frameXSlider: UISlider!
    @IBOutlet weak var boundsXSlider: UISlider!
    @IBOutlet weak var frameYSlider: UISlider!
    @IBOutlet weak var boundsYSlider: UISlider!
    
    //슬라이더 변동에 따른 라벨을 구성한다.
    @IBOutlet weak var frameOriginLabel: UILabel!
    @IBOutlet weak var boundsOriginLabel: UILabel!
    @IBOutlet weak var frameYOriginLabel: UILabel!
    @IBOutlet weak var boundsYOriginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //frame 과 bounds 의 차이를 알 수 있도록 값을 연결하여 준다.
        frameXSlider.value = Float(containerView.frame.origin.x)
        boundsXSlider.value = Float(containerView.bounds.origin.x)
        
        frameYSlider.value = Float(containerView.frame.origin.y)
        boundsYSlider.value = Float(containerView.bounds.origin.y)
        
        updateValues()
    }
    
    //프레임(X)이 변할때 사용하는 액션 메서드
    @IBAction func frameXSliderChanged(_ sender: AnyObject) {
        containerView.frame.origin.x = CGFloat(frameXSlider.value)
        updateValues()
    }
    
    //bounds(X)가 변할때 대응하는 액션 메서드
    @IBAction func boundsXSliderChanged(_ sender: AnyObject) {
        containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
        updateValues()
    }
    
    //프레임(Y)이 변할때 사용하는 액션 메서드
    @IBAction func frameYSliderChanged(_ sender: AnyObject) {
        containerView.frame.origin.y = CGFloat(frameYSlider.value)
        updateValues()
    }
    
    //bounds(Y)가 변할때 대응하는 액션 메서드
    @IBAction func boundsYSliderChanged(_ sender: AnyObject) {
        containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateValues()
    }
    
    //프레임이 변할때, 실행되는 메서드, 해당 파일내에서만 실행이 되어야 하므로, fiflePrivate를 사용한다.
    fileprivate func updateValues() {
        frameOriginLabel.text = "Frame x origin = \(Int(containerView.frame.origin.x))"
        boundsOriginLabel.text = "Bounds x origin = \(Int(containerView.bounds.origin.x))"
        frameYOriginLabel.text = "Frame y origin = \(Int(containerView.frame.origin.y))"
        boundsYOriginLabel.text = "Bounds y origin = \(Int(containerView.bounds.origin.y))"
    }
    
}

