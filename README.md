# Siwft에 대하여 학습한 내용 정리


### PART1 - SWIFT BASIC & OUTLET
* Swift기초 - Button UI 연결, 간단한 Error 처리 관련 Tip
* Error 확인시, Console창 확인 및 IBAction과 연결된 부분이 정상적으로 되어 있는지 확인, Storyboard에서 확인이 가능함
* iOS App은 어떻게 구동되는가?</br>
	1) iOS의 시스템의 경우 상시 구동이긴 하나, 마치 잠자고 있는 상태와 같아서, 사용자가 특정 명령어를 주지 않는 이상, 동작하지 않는다.</br>
	2) 특정 명령어가 input되면 그 즉시 필요한 메서드를 구현하고, 사용자에게 그에 알맞는 Feed-Back을 제공하여 준다.</br>
	3) 사용자가 다시 input되기 전까지 다시 잠자기와 같은 상태로 돌아가서 또다른 Input이 들어올때 까지 기다린다.</br>

* Object란 무엇인가?</br>
	1) App 은 오브젝트들의 모임으로 이루어져있다.(ex: 데이터를 Parsing하거나, User를 인증하거나, 데이터를 계산하는 작업등을 한다.)</br>
	2) 몇몇 오브젝트들은 iOS에서 기본적으로 제공하여 준다.(UIButton, ViewController, AlertObject, String등)</br>
	3) 몇몇 오브젝트들은 개발자가 직접 써서 정의해줘야 한다.</br>
* Data란 무엇인가?</br>
	1) Object의 특성을 나타내는 것을 가르킨다. 예를 들면 Label의 컬러, 위치, 높이 넓이, 데이터의 값등을 나타낸다</br>
* Functionality란 무엇인가?</br>
	1) User의 Tap을 인식하거나, 강조하기 위한 기능을 수행하거나, 일련의 Action과정을 수행한다.</br>
	2) Swift에서는 주로 func 로 시작되는 메서드들을 지칭한다.</br>
	
Swift에서는 상위 세가지 개념들이 유기적인 관계를 가지며, 서로의 데이터를 교환하거나, 서로가 가지고 있는 Data를 교류하거나, 서로의 액션에 반응하며 일련의 행위들을 실행한다.
(객체지향 언어)

* Swift의 다양한 변수에 대한 Scope들
	1) Global Scope : 전체 App에서 사용될 수 있는 변수를 말한다.
	2) Instance Scope : View컨트롤러 같이 클래스내에서 정의되어 클래스 내에서 사용 될 수 있는 변수를 말한다.
	3) Local Scope : 메서드 내에서만 유효한 변수를 말한다.

* Method 설정
	1) Swift에서 Method를 사용하여, 기능을 구현할 수 있도록 한다.(func) </br>
	2) 개발을 진행하면서, 중복된 코드의 사용은 피하도록 하고, 하나의 Method로 정의하여 진행한다.</br>
	2) 메소드를 작성할때, 해당기능외의 기능을 구현해야 할때는, 새로운 메소드를 넣고 메소드 안에서 메소드를 실행하여 준다.(메소드의 기능 최소화)
* 변수와 상수의 차이
	1) 변수 : var 로 표시하며, 값이 바뀔 수 있다</br>
	2) 상수 : let 로 표시하며, 값이 바뀔 수 없다</br>
	3) 스위트프 컴파일러가 해당코드를 분석하여, 상수를 쓰는것이 적합한 경우, 상수를 쓸 것을 권장하여 준다.</br>
* Type Inference
	1) Swift의 경우, 타입 추정을 통하여 변수의 값이 선언이 되면 어떤 타입인지 추론이 가능해 진다. </br>
	`var score = 0 // 해당 변수의 경우 Int Type으로 추론이 가능해진다.`
* LOCAL & Instance 변수
	1) Instance 변수란, method 안에 있는 변수는 메서드 안에서만 동작하며, 메서드가 종료될때까지 유효한 변수이다. 즉 메서드 밖에서 메서드 안에 있는 변수를 호출할 수 없다.</br>
	2) Local 변수란, 주로 클래스 내에 위치하며, 클래스가 실행되는 동안 유효한 변수이다. 클래스 안에 메서드가 존재하므로, 메서드 내에서도 해당 변수를 참조하거나, 값을 변경 할 수 있다.</br>
	
* Clousure 
	1) 클로져란, 어떤 동작이 완료된 후, 다음에 어떤 명령을 실행하기 위해 작성한다.</br>
	```
	        // 간단한 클로저 실행
        // UIAlert의 경우, handler에 다음 행동을 넣게 되면, 해당 액션이 실행된 후, 다음 명령이 실행된다. 해당 형태를 클로져라고 한다.
        // 클로져는 여러 형태가 있으나, {} 기호를 삽입하여, 클로져를 실행 할 수 있도록 해준다.
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            //메서드 내에서 실행이므로 self를 기재하여 준다.
            self.startNewRound()
        })
	```
	
* ViewController 간 이동, Segue
	1) ViewController 간 이동시, Segue를 통하여 이동할 수 있다</br>
	2) Present modally, show 등을 사용하여, ViewController 간 이동이 가능하다.</br>
	3) Dismiss method 를 통하여, 이동하기전 ViewController로 돌아가는 것이 가능하다. </br>
	```
	    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
	```

### PART2 - Swift Styling the App
* Assets 폴더를 활용하여, 이미지를 등록 / 사용 할 수 있다.</br>
* 코드를 사용하여, UI설정을 할 수 있으며, Assets에 등록된 아이템의 경우, 파일명을 직접 호출하여 사용 할 수 있다.</br>
	```
	        //슬라이더의 UI를 코드로 작성하여 준다.
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // UIImage(named: "SlideThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") // UIImage(named: "SlideThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        //인셋을 설정한다.
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft") // UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight") // UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
	```
* Xcode의 Attributes Inspector 를 통하여, 여러 인스턴스 값들을 조정할 수 있다.
* Autolayout
	1) 여러 iOS 기기에 대응하기 위하여, 오토 레이아웃을 적용할 수 있다.</br>
	2) 전체 스크린을 기준으로 자동으로 대응이 되기도 하며, 한 객체의 절대 값을 지정 후, 수평, 수직 조절을 통하여 오토 레이아웃을 적용한다.</br>
	3) 코드로도 가능하며, 코드 오토레이아웃은 추후 다루도록 한다.</br>
* App Icon 설정하기
	1) PNG 이미지를 준비한다.</br>
	2) 각 기기별, 상황별에 맞게 이미지의 픽셀을 설정한 후, Assets 에 각 항목에 맞게 드래그하여 업로드 해준다.</br>
	
	
### PART3
1) Programming in Swift : Core Concepts

* Playground 활용
* comment 활용(주석 활용)
* Tuple 활용

	```
	//Tuple에 대한 간단한 정리
	// 2가지이상의 값을 하나의 변수에 지정할 수 있다.
	let coordinates : (Int, Int) = (2, 3)

	// 타입 추론 기능을 지원한다.
	let coordinatesDouble = (2.3, 2.5)
	// 다른 타입이 같이 쓰일 수 있다
	let coordinatesMixed: (Double, Int) = (2.5, 2)

	// 변수의 Index 번호를 통하여, 값을 가져올 수 있다.
	let x1 = coordinates.0
	let y1 = coordinates.1

	// Tuple 안에 있는 인덱스 값을 설정하여 줄수 있다
	let coordinatesNamed = (x: 2, y: 3)
	let x2 = coordinatesNamed.x
	let y2 = coordinatesNamed.y
	
	let coordinates3D = (x: 2, y: 3, z: 1)
	// 변수명 세개를 Tuple에 값을 이용하여 한줄로도 표현이 가능하다.
	let (x3, y3, z3) =  coordinates3D
	//변수명 세개 이상인 경우, 그 중 일부만 값을 가져오고 싶을때, 와일드카드(_)를 활용하여 데이터를 참조할 수 있다.
	let (x4, y4, _) = coordinates3D

	```
	
* Boolean 활용

	```
		//Booleans에 대하여
	//True or False인가를 식별하는 타입이다.
	
	//타입추론이 되기 때문에, Bool을 빼고 기재해도 오류가 나지 않는다.
	let yes:Bool = true
	let no:Bool = false
	
	//다음은 Boolean 값을 변수명으로 설정하여 표기한 에제이다.
	let doesOneEqualTwo = (1 == 2)
	let doesNotEqualTwo = (1 != 2)
	
	let isOneGreaterThanTwo = (1 > 2)
	let isOneLessThanTwo = (1 < 2)
	
	let and = true && true
	let or = false || false || true
	
	let andTrue = 1 < 2 && 4 > 3
	let andFalse = 1 < 2 && 3 > 4
	
	let orTrue = 1 < 2 || 3 > 4
	let orFalse = 1 == 2 || 3 == 4
	
	//예제
	let guess = "cat"
	let dogEqualsCat = guess == "dog"
	
	let order = "cat" < "dog"
	let a = 5
	let b = 10
	
	//a가 b 보다 작을 경우, a의 값을 반환해 주고 그렇지 않을 경우 "?" 마크를 사용하여, a에 대입해줄 숫자를 정한다.
	//두가지 변수의 크기많을 비교하여, True일때는 a를 그렇지 않을 경우 b를 반환해준다.
	let min = a < b ? a : b
	```
* Scope 

 ```
	//Scope 에 대하여
	
	var hoursWorked = 45
	var price = 0
	
	if hoursWorked > 40 {
	    let hoursOver40 = hoursWorked - 40
	    price += hoursOver40 * 50
	    hoursWorked -= hoursOver40
	}
	
	price += hoursWorked * 25
	print(price)
	
	// print(hoursOver40) 컴파일 에러 : scope가 종료된 변수를 요청하였기 때문에
 ```

2) Programming in Swift : Flow Control

* While Loops

	```
	
	//While Loops 에 대하여
	
	var i = 1
	
	//while 문을 사용하여, 해당 조건이 false 가 될때까지 계속해서 while 문안에 있는 내용을 실행한다.
	while i < 10 {
	    print(i)
	    i += 1
	}
	print("- - -")
	
	// repeat문을 활용한 while 문을 구현하여 보자.
	i = 10
	// repeat안에 구문이 계속 해서 실행된다.
	// repeat문은 while 문의 true // false 여부에 관계없이 최초 1회는 무조건 실행된다.
	repeat {
	    print(i)
	//    if i == 5 {
	//        break
	//    }
	    i += 1
	} while i < 10 // 해당 조건이 만족하지 않을때까지 repeat문은 게속해서 실행이된다.
	print(i)
	print("- - -")
	```
* for Loops

	```
	
	//For Loops 에 대하여
	
	let closedRange = 0...5
	
	let halfOpenRange  = 0..<5
	
	var sum = 0
	let count = 10
	
	//for 문의 경우 in 이후의 값이 차레대로 대입이 되면서 반복 작업을 진행한다.
	for i in 1...count {
	    sum += i
	}
	print(sum)
	
	//변수명을 지정해줄때, " _ " 를 쓸 수 있다.
	for _ in 0..<count {
	    print("Hodor!")
	}
	
	for i in 1...count {
	    
	    //if 문의 true에 해당하는 아이템만 실행된다.
	    if i % 2 == 0 {
	        print("\(i) is ad odd number!")
	    }
	}
	```
* Switch

	```
	//Switch Loops 에 대하여
	// 스위치문은 특정 변수의 값에 따라서 그 값에 해당하는 다음 행동을 시행하는 것을 말한다.
	let number = 10
	switch number {
	case 0:
	    print("Zero")
	case 1...9:
	    print("Between 1 and 9")
	case 10:
	    print("Ten")
	default:
	    print("Undefined")
	}
	
	let string = "Dog"
	
	switch string {
	case "Dog", "Cat":
	    print("Animal is a house pet")
	default:
	    print("Animal is not a house pet")
	}
	
	
	switch number {
	case _ where number % 2 == 0:
	    print("Even \(number)")
	default:
	    print("Odd")
	}
	
	//Tuple, Where를 이용한 스위치 문작성도 가능하다.
	let coordinates = (x:2, y:2, z:5)
	switch coordinates {
	case (0, 0, 0):
	    print("Origin")
	case (let x, 0, 0):
	    print("On the x-axis at x=\(x)")
	case (0, let y, 0):
	    print("On the y-axis at y=\(y)")
	case (0, 0, let z):
	    print("On the z-axis at z=\(z)")
	case let (x, y, _) where y == x:
	    print("Along the y=x line.")
	case let (x, y, _) where y == x * x:
	    print("Along the y=x^2 line.")
	    
	case let (x, y, z):
	    print("Somewhere in space at x=\(x), y=\(y), z=\(z)")
	}
	```
	
	










## 참고자료
### FastCampus 수업 내용
### Ray Wenderlich 강의 내용
### Udemy Swift4 강좌 내용(Mark Price, Ray Wenderlich)