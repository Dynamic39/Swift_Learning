//
//  SectionHeader.swift
//  CollectionView
//
//  Created by Samuel K on 2017. 12. 8..
//  Copyright © 2017년 Razeware. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    @IBOutlet private weak var flagImage: UIImageView!
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var titleLB:UILabel!
    
    var section: Section! {
        didSet{
            titleLB.text = section.title
            flagImage.image = UIImage(named: section.title ?? "")
            countLabel.text = "\(section.count)"
        }
    }
        
}
