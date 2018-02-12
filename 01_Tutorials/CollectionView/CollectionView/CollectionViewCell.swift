//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Samuel K on 2018. 2. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var selectionImage: UIImageView!
    
    var isEditing: Bool = false {
        didSet {
            selectionImage.isHidden = !isEditing
        }
    }
    
    //선택되었을때 이미지의 값을 조정하는 역할을 한다.
    override var isSelected: Bool {
        didSet {
            if isEditing {
                selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
    
}
