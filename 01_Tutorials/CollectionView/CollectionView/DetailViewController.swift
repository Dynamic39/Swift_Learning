//
//  DetailViewController.swift
//  CollectionView
//
//  Created by Samuel K on 2018. 2. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selection:String!
    @IBOutlet private weak var detailsLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsLabel.text = selection
        
    }
}
