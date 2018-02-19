//
//  RWScrollView.swift
//  CustomScrollView
//
//  Created by Samuel K on 2018. 2. 19..
//  Copyright © 2018년 Razeware. All rights reserved.
//

import UIKit

//Code를 통한 간단한 ScrollView를 구성하여 보자.
class RWScrollView: UIView {
    
    //초기화 설정, 제스쳐 설정
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panView(with:)))
        addGestureRecognizer(panGesture)
    }
    
    //실제로 제스쳐를 작동하는 메서드를 만들어 준다.
    @objc func panView(with gestureRecognizer: UIPanGestureRecognizer){
        //제스쳐를 인식하는 프로퍼티를 생성한다.
        let translation = gestureRecognizer.translation(in: self)
        //애니매이션 효과를 지정하여 준다.
        UIView.animate(withDuration: 0.20) {
            //y축이 이동이 이루어지고, bounds 값이 바뀌게 진행하여 준다.
            self.bounds.origin.y = self.bounds.origin.y - translation.y
        }
        //초기 Translation 값을 정한다.
        gestureRecognizer.setTranslation(CGPoint.zero, in: self)
        
    }
    
    

}
