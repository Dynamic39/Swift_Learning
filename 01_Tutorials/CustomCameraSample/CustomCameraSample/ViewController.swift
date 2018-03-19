//
//  ViewController.swift
//  CustomCameraSample
//
//  Created by Samuel K on 2018. 3. 19..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  
  @IBAction func cameraBtn(_ sender: Any) {
    
    performSegue(withIdentifier: "showPhotoSegue", sender: nil)
    
  }
  

}

