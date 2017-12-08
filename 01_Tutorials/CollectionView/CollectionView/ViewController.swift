//
//  ViewController.swift
//  CollectionView
//
//  Created by Samuel K on 2017. 12. 1..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var deleteButton: UIBarButtonItem!
    @IBOutlet private weak var addButton: UIBarButtonItem!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    @IBAction func deleteSelected() {
        if let selected = collectionView.indexPathsForSelectedItems {
            let items = selected.map{$0.item}.sorted().reversed()
            
            for item in items {
                collectionData.remove(at: item)
            }
            collectionView.deleteItems(at: selected)
            navigationController?.isToolbarHidden = true
        }
        
    }
    
    @IBAction func addItem() {
        
        collectionView.performBatchUpdates({
            
            for _ in 0..<2 {
                let text = "\(collectionData.count + 1) 🐸"
                collectionData.append(text)
                let index = IndexPath(row: collectionData.count - 1 , section: 0)
                collectionView.insertItems(at: [index])
            }
        }, completion: nil)
        
    }
    
    
    
    var collectionData = ["1 🐶", "2 🐱", "3 🐭", "4 🐹", "5 🐰", "6 🦊", "7 🐻", "8 🐼", "9 🐨", "10 🐯", "11 🦁", "12 🐮", "13 🐷"]
    
    @objc func refresh() {
        addItem()
        collectionView.refreshControl?.endRefreshing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        collectionView.refreshControl = refresh
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        navigationController?.isToolbarHidden = true
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 스토리보드를 이용한 자동 세팅
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "DetailViewController" {

            if let dest = segue.destination as? DetailViewController,
                let index = sender as? IndexPath {
                dest.selection = collectionData[index.row]
            }
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        //navigationController?.isToolbarHidden = !editing
        
        addButton.isEnabled = !editing
        deleteButton.isEnabled = editing
        collectionView.allowsMultipleSelection = editing
        
        let indexes = collectionView.indexPathsForVisibleItems
        for index in indexes {
            let cell = collectionView.cellForItem(at: index) as! CollectionViewCell
            cell.isEditing = editing
        }
        if !editing {
            navigationController?.isToolbarHidden = true
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        let rows = collectionData.count
        
        return rows
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.titleLabel.text = collectionData[indexPath.row]
        cell.isEditing = isEditing
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing {
            performSegue(withIdentifier: "DetailViewController", sender: indexPath)
        } else {
            navigationController?.isToolbarHidden = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isEditing {
            if let selected = collectionView.indexPathsForSelectedItems,
                selected.count == 0 {
                navigationController?.isToolbarHidden = true
            }
            
        }
    }
}

