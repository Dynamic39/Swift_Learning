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
* Notwithstanding the foregoing, you may not use, copy, modify, merge, publish, 
* distribute, sublicense, create a derivative work, and/or sell copies of the 
* Software in any work that is designed, intended, or marketed for pedagogical or 
* instructional purposes related to programming, coding, application development, 
* or information technology.  Permission for such use, copying, modification,
* merger, publication, distribution, sublicensing, creation of derivative works, 
* or sale is expressly withheld.
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

//Park의 클래스를 생성할 것
class Park {
    
    //name, state, date, photo, index 를 프로퍼티로 설정할것,(index 는 Int 나머지는 String)
    var name: String
    var state: String
    var date: String
    var photo: String
    var index: Int
    
    //초기화 값은 각각의 이름을 가지는 것으로 설정할것.(Default init)
    init(name: String, state: String, date: String, photo:String, index: Int) {
        
        self.name = name
        self.state = name
        self.date = date
        self.photo = photo
        self.index = index
        
    }
    
    //convenience init은 자신의 클래스를 가지는 파라미터를 설정하여 진행하여 줄것.
    //convenience init에 대한 추가 설명을 확인하여, 주석 처리 할것.
    //이미 가지고 있는 데이터를 추가로 생성하지 않고, 그대로 가져오기 위하여, 편의 초기화를 진행한다.
    //이로인해, 기존의 변수값을 한번더 가져오는 것이 아닌, 이미 만들어진 DataModel에서 그 값을 가져와서 초기화를 진행할 수 있다.

    convenience init(copying park: Park) {
        //convenience init 후엔, Default init도 같이 실행하여 주어서 초기화가 정상적으로 처리 될 수 있도록 지원한다.
        self.init(name: park.name, state: park.state, date: park.date, photo: park.photo, index: park.index)
    }
    
    
}


















