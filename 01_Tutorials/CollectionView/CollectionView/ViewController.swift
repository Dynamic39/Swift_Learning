//
//  ViewController.swift
//  CollectionView
//
//  Created by Samuel K on 2018. 2. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //컬렉션 뷰를 컨트롤 하기 위한, 프로퍼티를 설정한다.
    @IBOutlet private weak var collectionView:UICollectionView!
    
    //컬렉션뷰에 들어갈 변수를 작성한다.
    var collectionData = ["1 🐶","2 🐱", "3 🐭", "4 🐹", "5 🐰", "6 🦊", "7 🐻", "8 🐼", "9 🐨","10 🐯", "11 🦁", "12 🐮"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //아이템의 사이즈를 결정하기 위한 작업을 한다.
        //아이템간의 spacing값이 있으므로 그 값을 제외한 값을 기준으로 계산해준다.
        let width = (view.frame.size.width - 20) / 3
        //아이템의 사이즈를 설정하기 위하여, 플로우레이아웃으로 타입캐스팅 해준다.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//컬렉션 뷰를 분류하기 위한 Extension을 설정한다.
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //아이템 수를 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    //셀의 reuse를 위한 메서드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        
        //라벨에 텍스트를 보여지기 위한 작업을 한다.
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = collectionData[indexPath.row]
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row) 가 선택되었습니다")
    }

}

