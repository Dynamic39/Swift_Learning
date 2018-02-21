/*
 * Copyright (c) 2015 Razeware LLC
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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //아이콘 테이블 뷰 컨트롤러 실행부분
    var iconViewControllers = [IconTableViewController]()
    
    //아이콘이 보여지는 부분과, 매뉴부분의 네비게이션 컨트롤러를 조정하는 두개의 네비게이션 컨트롤러 선언
    var iconsNav: UINavigationController!
    var menuNav: UINavigationController!
    var sideBarVC: SidebarViewController!
    
    //앱이 종료되었을때, 실행되는 부문
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        //IconSet이 두개로 생성이 되어 있으므로 for문으로 구별하여 준다.
        for iconSet in IconHelper.allIconSets() {
            
            let iconVC = storyboard.instantiateViewController(withIdentifier: "IconsVC") as! IconTableViewController
            
            //딜리게이트가 사용될 수 있도록 채택하여 준다.
            iconVC.delegate = self
            iconVC.iconSet = iconSet
            
            iconViewControllers.append(iconVC)
            //두개의 뷰컨트롤러가 생성됨.
        }
        
        //처음 시작될때, 0번의 인덱스의 아이템이 실행되게 하여 준다.
        iconsNav = UINavigationController(rootViewController: iconViewControllers[0])
        
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuTableViewController
        menuVC.delegate = self
        menuNav = UINavigationController(rootViewController: menuVC)
        
        sideBarVC = SidebarViewController(leftViewController: menuNav, mainViewController: iconsNav, overlap: 70)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = sideBarVC
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

//각 딜리게이트의 구현부
//앱 델리게이트에 직접 구현하여, 가장 상위에서 컨트롤이 가능하도록 진행함.
extension AppDelegate: IconTableViewControllerDelegate {
    func iconTableViewControllerDidTapMenuButton(_ controller: IconTableViewController) {
        //탭버튼이 실행되었을때, 메뉴쪽으로 넘어 갈 수 있도록 구현하여 준다.
        //window?.rootViewController = menuNav
        sideBarVC.toggleLeftAnimated(true)
    }
}

//MenuTableViewControllerDelegate 구현부
extension AppDelegate: MenuTableViewControllerDelegate {
    func menuTableViewController(_ controller: MenuTableViewController, didSelectRow row: Int) {
        
        //window?.rootViewController = iconsNav
        
        //선택된 row에 따라 아이콘 뷰 컨트롤러가 다르게 될 수 있도록 작성하여 준다.
        let destinationViewController = iconViewControllers[row]
        
        if iconsNav.topViewController != destinationViewController {
            iconsNav.setViewControllers([destinationViewController], animated: true)
        }
        
        sideBarVC.closeMenuAnimated(true)
    }
}

