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
    //추가 버튼 생성
    @IBOutlet private weak var addButton:UIBarButtonItem!
    
    //컬렉션뷰에 들어갈 변수를 작성한다.
    var collectionData = ["1 🐶","2 🐱", "3 🐭", "4 🐹", "5 🐰", "6 🦊", "7 🐻", "8 🐼", "9 🐨","10 🐯", "11 🦁", "12 🐮"]
    
    //객체 하나를 추가하는 메서드를 만들어 준다.
    @IBAction func addItem() {
        
        collectionView.performBatchUpdates({
            
            for _ in 0..<2 {
                //현재 숫자보다 하나 큰 수를 더하고, 이모티콘을 더한다.
                let text = "\(collectionData.count + 1) 🐧"
                //데이터 추가
                collectionData.append(text)
                //index path를 설정한다. 이때, 전체카운트보다 -1 한 곳에 진행하여 준다.
                let index = IndexPath(row: collectionData.count - 1, section: 0)
                //아이템을 추가한다. 리로드의 경우, 전체 아이템을 해제한 후, 재설정이기 때문에 비추천이다.
                collectionView.insertItems(at: [index])
            }
        }, completion: nil)
    }
    
    //당겨서 새로고침을 만들어보자
    @objc func refresh() {
        addItem()
        collectionView.refreshControl?.endRefreshing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //당겨서 리프레시 하기 위하여 작업을 진행하여 준다.
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        collectionView.refreshControl = refresh
        
        //아이템의 사이즈를 결정하기 위한 작업을 한다.
        //아이템간의 spacing값이 있으므로 그 값을 제외한 값을 기준으로 계산해준다.
        let width = (view.frame.size.width - 20) / 3
        //아이템의 사이즈를 설정하기 위하여, 플로우레이아웃으로 타입캐스팅 해준다.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        //아이템을 지우는 코드를 작성하여 보자
        navigationItem.leftBarButtonItem = editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //데이터를 넘기기 위한 작업을 한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue" {
            if let dest = segue.destination as? DetailViewController,
                let index = sender as? IndexPath {
                
                dest.selection = collectionData[index.row]
                
            }
        }
    }
    
    //데이터를 수정/삭제하기 위한 메서드를 구현한다.
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        //수정모드일때는 addButton이 작동되지 않도록 한다.
        addButton.isEnabled = !editing
        collectionView.allowsMultipleSelection = editing
        let indexes = collectionView.indexPathsForVisibleItems
        for index in indexes {
            let cell = collectionView.cellForItem(at: index) as! CollectionViewCell
            cell.isEditing = editing
        }
        
        
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = collectionData[indexPath.row]
        cell.isEditing = isEditing
        
        return cell
    }
    //선택되었을때 동작하는 코드를 만든다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //performSegue 를 사용하여, 값을 가져온다.(특정 프로퍼티에 지정되지 않은 경우)
        
        if !isEditing {
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
        }
        
    }

}

