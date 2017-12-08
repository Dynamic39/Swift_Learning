/*
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

//그라데이션을 세팅하는 CustomView를 만듭니다.

class GradientView: UIView {
  
    // 해당 View가 처음으로 불려 올때, 진행되기 때문에 Lazy를 붙여, 인스턴스 생성을 지연
    // UI가 구성될때 한번에 인스턴스가 생성되도록 초기화를 시켜준다.
    
  lazy fileprivate var gradientLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.75).cgColor]
    layer.locations = [NSNumber(value: 0.0 as Float), NSNumber(value: 1.0 as Float)]
    return layer
    }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    //해당 View가 실행될때 색상 및 그라데이션 효과를 넣어준다.
    backgroundColor = UIColor.clear
    layer.addSublayer(gradientLayer)
  }
  
  override func layoutSubviews() {
		super.layoutSubviews()
    
    //그라데이션 효과의 애니메이션 효과를 진행하기 위한 메서드를 실행한다.
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		gradientLayer.frame = bounds
		CATransaction.commit()
  }
  
}
