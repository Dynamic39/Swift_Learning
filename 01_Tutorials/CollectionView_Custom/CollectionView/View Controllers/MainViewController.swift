/**
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
* Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
* distribute, sublicense, create a derivative work, and/or sell copies of the
* Software in any work that is designed, intended, or marketed for pedagogical or
* instructional purposes related to programming, coding, application development,
* or information technology.  Permission for such use, copying, modification,
* merger, publication, distribution, sublicensing, creation of derivative works,
* or sale is expressly withheld.
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

class MainViewController: UICollectionViewController {
	@IBOutlet private weak var addButton:UIBarButtonItem!
	@IBOutlet private weak var deleteButton:UIBarButtonItem!
	
	private let dataSource = DataSource()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Set up a 3-column Collection View
		let width = view.frame.size.width / 3
		let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width:width, height:width)
        
        //각 타이틀의 차례일때 핀을 설정해주어, 고정이 될 수 있도록 해준다.
        layout.sectionHeadersPinToVisibleBounds = true
        
		// Refresh control
		let refresh = UIRefreshControl()
		refresh.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
		collectionView?.refreshControl = refresh
		// Toolbar
		navigationController?.isToolbarHidden = true
		// Edit
		navigationItem.leftBarButtonItem = editButtonItem
        
        
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "DetailSegue" {
			if let dest = segue.destination as? DetailViewController {
				dest.park = sender as? Park
			}
		}
	}
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		addButton.isEnabled = !editing
		collectionView?.allowsMultipleSelection = editing
		if !editing {
			navigationController?.isToolbarHidden = true
		}
		guard let indexes = collectionView?.indexPathsForVisibleItems else {
			return
		}
		for index in indexes {
			let cell = collectionView?.cellForItem(at: index) as! CollectionViewCell
			cell.isEditing = editing
		}
	}
	
	@IBAction func addItem() {
        //새로운 아이템을 하나씩 추가해주는 역할을 한다.
		let index = dataSource.indexPathForNewRandomPark()
		collectionView?.insertItems(at: [index])
	}
	
	@objc func refresh() {
		addItem()
		collectionView?.refreshControl?.endRefreshing()
	}
	
	@IBAction func deleteSelected() {
		if let selected = collectionView?.indexPathsForSelectedItems {
			dataSource.deleteItemsAtIndexPaths(selected)
			collectionView?.deleteItems(at: selected)
			navigationController?.isToolbarHidden = true
		}
	}
}

extension MainViewController {
    
    //헤더부문 커스텀
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //View를 지정해줘서, 헤더부분에서 컨트롤이 가능하도록 만들어준다.
        //해당 뷰가 실행되면서 아웃렛이나 프로퍼티가 동작을 하게된다.
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        
        //섹션부문의 데이터를 불러와 인스턴스를 만들어준다.
        let section = Section()
        //각각의 섹션별로 입력되는 데이터를 받아온다.
        section.title = dataSource.titleForSectionAtIndexPath(indexPath)
        section.count = dataSource.numberOfParksInSection(indexPath.section)
        
        //해당 섹션의 정보를 view안에 있는 섹션 정보에 넣어준다.
        view.section = section
        
        return view
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSections
        
    }
    
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
		return dataSource.numberOfParksInSection(section)
        
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
            cell.park = dataSource.parkForItemAtIndexPath(indexPath)
			cell.isEditing = isEditing
        
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if !isEditing {
			let park = dataSource.parkForItemAtIndexPath(indexPath)
			performSegue(withIdentifier: "DetailSegue", sender: park)
		} else {
			navigationController?.isToolbarHidden = false
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if isEditing {
			if let selected = collectionView.indexPathsForSelectedItems, selected.count == 0 {
				navigationController?.isToolbarHidden = true
			}
		}
	}
}
