//
//  SectionHeader.swift
//  CollectionView
//
//  Created by Samuel K on 2018. 2. 16..
//  Copyright © 2018년 Razeware. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var flagImage: UIImageView!
    @IBOutlet private weak var countLabel: UILabel!
    
    var section:Section! {
        didSet {
            titleLabel.text = section.title
            flagImage.image = UIImage(named: section.title ?? "")
            countLabel.text = "\(section.count)"
        }
    }
    
    
    
    
        
}
