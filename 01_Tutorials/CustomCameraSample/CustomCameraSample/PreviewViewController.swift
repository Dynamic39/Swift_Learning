//
//  PreviewViewController.swift
//  CustomCameraSample
//
//  Created by Samuel K on 2018. 3. 19..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

  @IBOutlet weak var photo: UIImageView!
  
  var image:UIImage!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      photo.image = self.image
      
      

        // Do any additional setup after loading the view.
    }
  
  @IBAction func cancelAction(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func saveAction(_ sender: Any) {
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    dismiss(animated: true, completion: nil)
    
  }
  
  

}
