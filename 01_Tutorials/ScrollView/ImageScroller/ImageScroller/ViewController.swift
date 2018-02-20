//
//  ViewController.swift
//  ImageScroller
//
//  Created by Brian on 2/9/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //스크롤 뷰를 연결하는 아웃렛을 생성한다.
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //인셋을 추가 안하는 프로퍼티 추가
        scrollView.contentInsetAdjustmentBehavior = .never
        
        //컨텐츠 사이즈를 이미지뷰 사이즈로 잡아준다.
        //scrollView.contentSize = (imageView?.image?.size)!
        
        //Size Zoom
        //이미지 뷰의 프레임 사이즈와 이미지 사이즈를 맞춰준다.
        imageView.frame.size = (imageView.image?.size)!
        //Delegate 채택
        scrollView.delegate = self
        setZoomParametersForSize(scrollView.bounds.size)
        recenterImage()
        
    }
    
    //이미지를 가운데로 정렬 시켜준다.
    func recenterImage() {
        
        //ScrollView size와 imageView size를 가져온다.
        let scrollViewSize = scrollView.bounds.size
        let imageSize = imageView.frame.size
        
        //가운데 정렬을 하기 위하여 각각의 사이즈를 비교, 가운데를 맞춰주기 위한 수식을 넣어 준다.
        let horizontalSpace = imageSize.width < scrollViewSize.width ? (scrollViewSize.width - imageSize.width) / 2 : 0
        let verticalSpace = imageSize.height < scrollViewSize.height ? (scrollViewSize.height - imageSize.height) / 2 : 0
        
        //ScrollView에 인셋을 넣어준다.
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
        
    }
    
    override func viewWillLayoutSubviews() {
        setZoomParametersForSize(scrollView.bounds.size)
        recenterImage()
    }
    
    func setZoomParametersForSize(_ scrollViewSize: CGSize) {
        
        //이미지의 bounds size 설정
        let imageSize = imageView.bounds.size
        print("이미지 bounds full size :", imageSize.width, imageSize.height)
        let widthScale = scrollViewSize.width / imageSize.width
        print("widthScale", widthScale)
        let heightScale = scrollViewSize.height / imageSize.height
        print("heightScale", heightScale)
        let minScale = min(widthScale, heightScale)
        
        //zoom size setting
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        
        //최초 앱 구동시, 어떤 사이즈에 최적화하여 전체 이미지를 보여줄지 결정한다.
        scrollView.zoomScale = minScale
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//UIScrollView Delegate를 상속받는 컨트롤러를 익스텐션으로 설정하여 준다.
extension ViewController: UIScrollViewDelegate {
    
    //zoom이 가능한 메서드를 실행하여 준다.
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

