//
//  ViewController.swift
//  LayoutScroll
//
//  Created by Brian on 2/18/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    //리프레시 컨트롤 만들기
    var refreshControl: UIRefreshControl!
    
    
    @objc func refreshData(sender: UIRefreshControl) {
        print("Refresh Data")
        sender.endRefreshing()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData(sender:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull To RefreshData")
        
        scrollView.refreshControl = refreshControl
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

