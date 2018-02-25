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
    
    //MARK:- IB outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var buttonMenu: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    //오토레이아웃을 변동하기 위한 프로퍼티
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeButtonTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var titleCenterY: NSLayoutConstraint!
    @IBOutlet weak var titleCenterY_Open: NSLayoutConstraint!
    
    //MARK:- further class variables
    
    //슬라이더는 다른 클래스에서 선언이 됨.
    var slider: HorizontalItemList!
    var menuIsOpen = false
    var items: [Int] = [5, 6, 7]
    
    //MARK:- class methods
    
    @IBAction func toggleMenu(_ sender: AnyObject) {
        menuIsOpen = !menuIsOpen
        
        //TODO: Build your first constraint animation!
        //레이아웃 업데이트
        
        titleLabel.text = menuIsOpen ? "Select Item!!!!!!!!!!!" : "Packing List"
        view.layoutIfNeeded()
        
        //타이틀 오토레이아웃 조정 - 1
        titleCenterY.isActive = !menuIsOpen
        titleCenterY_Open.isActive = menuIsOpen
        
        //타이틀 레이블을 버튼 액션에 따라서 조정함.
        titleLabel.superview?.constraints.forEach { constraint in
            if constraint.firstItem === titleLabel && constraint.firstAttribute == .centerX {
                constraint.constant = menuIsOpen ? -100 : 0.0
                return
            }
        //타이틀 오토레이아웃 조정 - 2
//            if constraint.identifier == "TitleCenterY" {
//                constraint.isActive = false
//
//                let newConstraint = NSLayoutConstraint(
//                    item: titleLabel,
//                    attribute: .centerY,
//                    relatedBy: .equal,
//                    toItem: titleLabel.superview!,
//                    attribute: .centerY,
//                    multiplier: menuIsOpen ? 0.67 : 1.0,
//                    constant: 5.0
//
//                )
//
//                newConstraint.identifier = "TitleCenterY"
//                newConstraint.isActive = true
//
//            }
            
        }
        
        menuHeightConstraint.constant = menuIsOpen ? 200.0 : 60
        closeButtonTrailing.constant = menuIsOpen ? 16.0 : 8.0
        
        
        UIView.animate(
            withDuration: 0.33,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                
                //앵글 설정 -> + -> x 로 만들어줌
                let angle : CGFloat = self.menuIsOpen ? .pi/4 : 0.0
                self.buttonMenu.transform = CGAffineTransform(rotationAngle: angle)
                self.view.layoutIfNeeded()
        },
            completion: nil
        )
    }
    
    func showItem(_ index: Int) {
        
        //확인
        let imageView = makeImageView(index: index)
        view.addSubview(imageView)
        
        //애니매이션 효과를 넣어서 추가해줌
        //1. 오토레이아웃 추가
        let conX = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let conBottom = imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: imageView.frame.height)
        let conWidth = imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33, constant: -50.0)
        let conHeight = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        
        NSLayoutConstraint.activate([conX, conBottom, conWidth, conHeight])
        view.layoutIfNeeded()
        
        //애니메이션 효과
        UIView.animate(withDuration: 0.8, delay: 0.0, animations: {
            conBottom.constant = -imageView.frame.size.height / 2
            conWidth.constant = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        //애니매이션 아웃
        UIView.animate(withDuration: 0.67, delay: 2.0, animations: {
            conBottom.constant = imageView.frame.size.height
            conWidth.constant = -50
            self.view.layoutIfNeeded()
        }, completion: {_ in
            
        })
        
        
        
        
        
    }
    
    func transitionCloseMenu() {
        delay(seconds: 0.35, completion: {
            self.toggleMenu(self)
        })
    }
}

//////////////////////////////////////
//
//   Starter project code
//
//////////////////////////////////////

//TableView 관련 프로퍼티 및 익스텐션

//아이템 정의
let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

// MARK:- View Controller

//TableView Protocol 채택 및 익스텐션 활성화
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //이미지를 만들어줌.
    func makeImageView(index: Int) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "summericons_100px_0\(index).png"))
        imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    //슬라이더를 생성
    func makeSlider() {
        
        slider = HorizontalItemList(inView: view)
        slider.didSelectItem = {index in
            self.items.append(index)
            self.tableView.reloadData()
            self.transitionCloseMenu()
        }
        self.titleLabel.superview?.addSubview(slider)
    }
    
    // MARK: View Controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlider()
        self.tableView?.rowHeight = 54.0
    }
    
    // MARK: Table View methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(items[indexPath.row])
    }
    
}

