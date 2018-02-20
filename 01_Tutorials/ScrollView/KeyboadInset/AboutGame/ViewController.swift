/*
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fgScrollView: UIScrollView!
    @IBOutlet weak var felipeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animate the wings
        var animationFrames = [UIImage]()
        for i in 0...3 {
            if let image = UIImage(named: "Bird\(i)") {
                animationFrames.append(image)
            }
        }
        
        felipeImageView.animationImages = animationFrames
        felipeImageView.animationDuration = 0.4
        felipeImageView.startAnimating()
        
        //키보드에 따라 반응하는 알림센터를 설정한다.
        
        //키보드가 보였을때 실핸하는 노티
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        //키보드가 보였을때 실핸하는 노티
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        //각각의 메서드에서 실행하여 준다.
        adjustInsetForKeyboardShow(show: true, notification: notification)
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        //각각의 메서드에서 실행하여 준다.
        adjustInsetForKeyboardShow(show: false, notification: notification)
        
    }
    
    func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        
        //notification의 userInfo를 만들어준다.
        let userInfo = notification.userInfo ?? [:]
        //userInfo에 있는 정보중, 키보드의 대한 크기 정보를 가지고 온다.
        let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        //true / false 에 따른, 조정 범위를 설정한다.
        let adjustment = (keyboardFrame.height * (show ? 1 : -1)) + 20
        
        //컨텐츠 인셋/스크롤 인디케이터 인셋의 bottom의 사이즈를 현재기준에서 늘리거나 줄여준다.
        fgScrollView.contentInset.bottom += adjustment
        fgScrollView.scrollIndicatorInsets.bottom += adjustment
    }
    
    //노티피케이션 센터를 해제하는 deinit을 시행한다.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension ViewController: UIScrollViewDelegate {
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

