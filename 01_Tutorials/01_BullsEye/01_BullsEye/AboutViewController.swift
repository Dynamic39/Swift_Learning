//
//  AboutViewController.swift
//  01_BullsEye
//
//  Created by Samuel K on 2018. 1. 23..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //webview에 html파일을 붙여넣어줌.
        //메인 번들에 있는 html 페이지를 불러 온다.
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            //페이지가 있는 경우, 해당 url를 불러오는 데이터 구문을 실행한다.
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
        

    }

}
