/*
 * Copyright (c) 2015 Razeware LLC
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

class TutorialViewController: UIViewController {
    
    //스크롤뷰 아웃렛
    @IBOutlet weak var scrollView: UIScrollView!
    
    //페이지 컨트롤 아웃렛
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages = [TutorialStepViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        let page1 = createAndAddTutorialStep("bg_1", iconImageName: "icon_1", text: "PetShare is a pet photo sharing")
        let page2 = createAndAddTutorialStep("bg_2", iconImageName: "icon_2", text: "Take picture of your pat, adn add filters or clipart to help them")
        let page3 = createAndAddTutorialStep("bg_3", iconImageName: "icon_3", text: "Share your phtos via Facebook")
        let page4 = createAndAddTutorialStep("bg_4", iconImageName: "icon_4", text: "Rate other photos")
        let page5 = createAndAddTutorialStep("bg_5", iconImageName: "icon_5", text: "Set up a profile for your pet")
        
        pages = [page1, page2, page3, page4, page5]
        
        let views:[String: UIView] = ["view":view, "page1":page1.view, "page2":page2.view, "page3":page3.view, "page4":page4.view, "page5":page5.view]
        
        //각각의 마진을 설정하는 딕셔너리를 설정
        let metrics = ["edgeMargin": 10, "betweenMargins": 20]
        
        //오토레이아웃 설정
        let verticalContraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: [], metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargins-[page2(==view)]-betweenMargins-[page3(==view)]-betweenMargins-[page4(==view)]-betweenMargins-[page5(==view)]-edgeMargin-|", options: [], metrics: metrics, views: views)
        
        NSLayoutConstraint.activate(verticalContraints + horizontalConstraints)
    }
    
    //추가 view를 생성하기 위한 메서드 구성
    private func createAndAddTutorialStep(_ backgroundImageName: String, iconImageName: String, text: String) -> TutorialStepViewController {
        
        //스토리보드에서 지정된 뷰컨트롤러 호출
        let tutorialStep = storyboard!.instantiateViewController(withIdentifier: "TutorialStepViewController") as! TutorialStepViewController
        //자동으로 오토사이징 되는 것을 방지
        tutorialStep.view.translatesAutoresizingMaskIntoConstraints = false
        
        //각 프로퍼티 값 설정
        tutorialStep.backgroundImage = UIImage(named: backgroundImageName)
        tutorialStep.iconImage = UIImage(named: iconImageName)
        tutorialStep.text = text
        
        //스크롤뷰에 삽입
        scrollView.addSubview(tutorialStep.view)
        
        addChildViewController(tutorialStep)
        tutorialStep.didMove(toParentViewController: self)
        
        return tutorialStep
    }
}

//scrollView delegate를 사용하기 위한 익스텐션 호출
extension TutorialViewController: UIScrollViewDelegate {
    
    //페이징 컨트롤과 연결하기 위한 메서드
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //전체 페이지의 길이를 나타낸다.
        let pageWidth = scrollView.bounds.width
        //전체 페이지 길이에서 각각의 offset x 를 나눔으로서 현재 페이지를 알 수 있게 한다.
        let pageFraction = scrollView.contentOffset.x / pageWidth
        pageControl.currentPage = Int(round(pageFraction))
        
    }
    
}

