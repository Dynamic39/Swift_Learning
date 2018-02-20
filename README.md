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

3) Programming in Swift : Functions and Optionals

* Functions에 대하여

	```
	//Function에 대하여
	//func 를 작성하고, 메서드명을 기재해준다()안에 파라미터를 넣을 수 있으나, 공란으로도 가능하다
	func printMyName(){
	    //메서드가 실행되면, 수행할 작업을 기재한다.
	    print("My name is Sam Kyu")
	}
	//메서드를 실행할때 작성하여 준다.
	printMyName()
	//파라미터를 가지는 메서드를 작성하여 준다.
	func printMultipleOfFice(multiplier: Int, andValue:Int) -> Int {
	    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
	    
	    return multiplier * andValue
	}
	let result = printMultipleOfFice(multiplier: 5, andValue: 2)
	print(result)
	```
* functions 추가

	```
	//동일한 명의 메서드를 사용 할 수 있지만 몇가지 주의사항이 있다.
	//1. 파라미터 타입을 다르게 할 것(Int, String, Double)
	//2. 리턴값을 다르게 할것.
	//3. 새로운 파라미터를 추가 할 것.
	//위 조건중 하나라도 만족이 되면, 동일한 메서드명으로 여러 functions를 생성 할 수 있다.
	func getValue() -> Int {
	    return 32
	}
	func getValue() -> String {
	    return "hello"
	}
	//현재 샘플 코드의 경우, 리턴 타입이 다르기 때문에, 값을 사용하는 변수의 타입을 정확히 지정을 하면 사용이 가능하다.
	let value:Int = getValue()
	let value2:String = getValue()
	
	//기본적으로 파라미터 값의 경우, 상수의 값을 가지나, 메서드안에서 해당 값을 사용하여, 어떤 작업을 수행해야 할 경우.
	//inout 을 기입하여, 해당 값이 변경이 될 수 있도록 바꿔준다. 컴파일러 에러에서 벗어날 수 있다.
	func incrementAndPrint(_ value: inout Int) {
	    value += 1
	    print(value)
	}
	
	var value3 = 5
	//inout 을 기재하게 되면, & 마크가 붙어서 변경이 가능한 파라미터 값으로 인식이 되게 된다.
	incrementAndPrint(&value3)
	
	func add(_ a:Int, _ b:Int) -> Int {
	    return a + b
	}
	
	var function = add
	function(4, 2)
	
	func subtract(_ a:Int, _ b:Int) -> Int {
	    return a - b
	}
	
	function = subtract
	function(4, 2)
	
	//func printResult(_ function: (Int, Int) -> (Int), _ a:Int, _ b:Int) {
	//    let result = function(a, b)
	//    print(result)
	//}
	
	//typealias 를 통하여 파라미터의 인자값을 지정하여 줄수도 있다.
	typealias operation = (Int, Int) -> (Int)
	
	func printResult(_ function: operation, _ a:Int, _ b:Int) {
	    let result = function(a, b)
	    print(result)
	}
	
	printResult(add, 4, 2)
	printResult(subtract(_:_:), 4, 2)
	```

* Optional

	```
	//Optioanl
	//변수안에 값이 있을수도 있거나, 없는 경우 불확실성에 대한 표기로, 옵셔널을 사용한다.
	//타입 뒤에 ? 마크를 붙여서 표기하여, 이 변수만이 nil이 되어서 컴파일 에러가 일어나지 않는다. 보통의 변수의 경우 nil일 경우 컴파일 에러가 뜬다.
	var nickname:String?
	nickname = "The Darkness"
	nickname = nil
	
	//Int로 타입 캐스팅을 할때, 옵셔널이 들어간다. 이유는 적절한 타입이 아닐 경우, nil을 반환하기 위해서 이다.
	let parseInt = Int("10")
	
	//Optional unwrapped
	
	var result: Int? = 30
	print(result)
	
	//언래핑이 되지 않은 변수는 일반 변수와 같이 취급될 수 없다.
	//print(result + 1) // 컴파일 에러
	
	var authorName:String? = "Matt Galloway"
	var authorAge:Int? = 30
	
	//1. 강제로 "!" 마크를 붙여서 옵셔널 변수를 언래핑 해줄 수 있다.
	//만약에 nil값이 들어가 있으므로, 확실히 값이 들어오는 경우가 아니면 사용이 권장되지 않는다.
	//var unwrappedAuthorName = authorName!
	//print("Author is \(unwrappedAuthorName)")
	
	
	//2. Optional binding
	
	//if let을 사용하여, 옵셔널 바인딩 처리하여, 해당 값이 있을경우 (참인 경우), 다음 작업을 시행하고 그러지 않은 경우
	//else 처리하여 작업을 진행한다.
	if let unwrappedAuthorName = authorName {
	  print("Author is \(unwrappedAuthorName)")
	} else {
	  print("No Author")
	}
	
	func calculateNumberOfSides(shape: String) -> Int? {
	    switch shape {
	    case "Triangle":
	        return 3
	    case "Square":
	        return 4
	    case "Rectangle":
	        return 4
	    case "Pentagon":
	        return 5
	    case "Hexagon":
	        return 6
	    default:
	        return nil
	    }
	}
	
	func maybePrintSides(shape: String) {
	    
	    let sides = calculateNumberOfSides(shape: shape)
	    if let sides = sides {
	        print("A \(shape) has \(sides) sides")
	    } else {
	        print("I don't know the number of sides for \(shape)")
	    }
	}
	
	maybePrintSides(shape: "Triangle")
	
	// guard let 을 사용하여, 옵셔널 바인딩을 하는 경우도 있다. 이경우, 사용법은 비슷하지만, guard let의 경우, 한번 리턴이 실행되면 끝이 나기 때문에, Data를 주로 다루는 곳에서 사용하기 용이하다.
	func maybePrintSides2(shape: String) {
	    
	    guard  let sides = calculateNumberOfSides(shape: shape) else { print("I don't know the number of sides for \(shape)")
	        return
	    }
	    print("A \(shape) has \(sides) sides")
	}
	maybePrintSides2(shape: "Triangle")
	
	
	//빠르게 옵셔널을 해제 하고 싶을때, 해당값이 nil인 경우, 대체할 수 있는 값을 주는 방법도 가능하다. 이경우 "??" 를 붙여서 사용할 수 있다.
	var optionalInt: Int? = 10
	var mustHaveResult = optionalInt ?? 0
	```

4) Programming in Swift : Collections and Closure

* Array
	
	```
	// Array란? 변수안에 배열을 넣어서 값들을 가지고 있는 형태중 하나를 말한다.
	// Index가 0번부터 시작하므로, 데이터를 참조할 시, 0번부터 호출하여 사용이 가능하다.
	
	var evenNumbers:[Int] = [2, 4, 6, 8]
	let evenNumbers2: Array<Int> = [2, 4, 6, 8]
	
	//배열에 새로운 값을 추가/삭제/변경 하는 방법
	evenNumbers.append(10)
	evenNumbers += [12, 14, 16]
	evenNumbers.insert(0, at: 0)
	evenNumbers.remove(at: 0) // 지우고자 하는 인덱스를 지정하여 준다.
	evenNumbers[0] = -2 // 기존에 있던 값에서 새롭게 지정한 값으로 변경된다.
	
	//배열을 활용하는 여러 인스턴스가 있다.
	print(evenNumbers.isEmpty)
	print(evenNumbers.count)
	print(evenNumbers.first)
	
	//배열에 있는 숫자를 가져오기 위해선 인덱스 넘버를 지정해줘야 한다.
	var firstElement = evenNumbers[0]
	print(firstElement)
	let firstThree = evenNumbers[0...2]
	print(firstThree)
	
	//배열의 값을 하나씩 확인하는 방법
	for evenNumber in evenNumbers {
	    print(evenNumber)
	}
	
	//배열의 인덱스 값도 같이 확인하는 방법(Tuple을 활용하여 진행)
	for (index, evenNumber) in evenNumbers.enumerated() {
	    print("evenNumbers[\(index)] = \(evenNumber)")
	}
	```

* Dictionary

	```
	//Dictionary란? 키값에 해당하는 value값을 가지는 형식으로 인덱스 대신에 정확한 키값이 있는 것이 특징이다.
	
	var namesAndScores:[String:Int] = ["Anna":2, "Brian":2, "Craig":8, "Donna":6]
	print(namesAndScores)
	
	var namesAndScores2: Dictionary<String, Int> = ["Anna":2, "Brian":2, "Craig":8, "Donna":6]
	print(namesAndScores2)
	
	//딕셔너리 활용 예
	//직접 키값을 가져와 값을 가지고 오거나, 배열처럼, 카운팅이 가능하다.
	print(namesAndScores["Anna"]) // 키값이 정확하지 않을 수 있으므로, 옵셔널이다.
	print(namesAndScores["Craig1"]) // nil이 반환된다.
	
	namesAndScores.isEmpty
	namesAndScores.count
	namesAndScores["Anna"] = 10
	
	
	//딕셔너리 안에 있는 데이터를 하나씩 가져오는 방법
	//위치별로 컴파일러가 인식하기 때문에, player가 key값을, score가 value값을 가진다.
	for (player, score) in namesAndScores {
	    print("\(player) has a score of \(score)")
	}
	
	//key 값만 별도로 가져올 수도 있다.
	for player in namesAndScores.keys {
	    print("\(player)")
	}
	```
	
* Set

	```
	//Set이란? 유니크한 값을 가지는 형태로 중복되지 않은 형태로 가지고 있는 것을 말한다.
	
	var someSet:Set<Int> = [1, 2, 3, 1]
	print(someSet) // 중복되는 값을 없어지므로, [2, 3, 1] 만 프린트된다.
	print(someSet.contains(1)) // 값이 있으므로, true값이 반환된다.
	print(someSet.contains(99)) // 값이 없으므로 false 값이 반환된다.
	someSet.insert(5)
	print(someSet)
	someSet.remove(3)
	```
* Clousure

	```
	//Closure 란? 메서드안에서 추가로 시행되기 위하여 만들어놓는 기능
	
	var multiplyClosure: (Int, Int) -> Int
	multiplyClosure = { (a: Int, b:Int) -> Int in
	        return a * b
	}
	//클로저 형식을 만들어 놓는다.
	var addClosure: (Int, Int) -> Int = { a, b in
	    return a + b
	}
	let result = multiplyClosure(4, 2)
	
	//클로져는 메서드의 파라미터로 이용될 수 있다.
	func operateOnNumbers(_ a: Int, _ b:Int, operation:(Int, Int) -> Int) -> Int {
	    let result = operation(a, b)
	    print(result)
	    return result
	}
	
	//이미 만들어진 클로저를 대입하여, 값을 확인 할 수 있다.
	let randomMulti = operateOnNumbers(2, 4, operation: multiplyClosure)
	let randomPlus = operateOnNumbers(2, 4, operation: addClosure)
	print(randomMulti)
	print(randomPlus)
	
	//클로저를 직접 작성할 수 있다.
	let randomDivide = operateOnNumbers(10, 2, operation: { $0 / $1 })
	print(randomDivide)
	
	let voidClousure: () -> Void = {
	    print("Swift Apprentice is awesome!")
	}
	
	print(voidClousure)
	
	//클로져의 캡쳐 기능
	var counter = 0
	let incrementCounter = {
	    counter += 1
	}
	incrementCounter()
	incrementCounter()
	print(counter)
	
	//클로져의 캡쳐기능으로 인해, counter 변수가 하나씩 합쳐진다.
	func countingClousure() -> () -> Int {
	    var counter = 0
	    let incrementingCounter: () -> Int = {
	        counter += 1
	        return counter
	    }
	    return incrementingCounter
	    
	}
	let counter1 = countingClousure()
	let counter2 = countingClousure()
	
	counter1()
	counter1()
	counter1()
	counter2()
	
	```
	
* Closures and Collection [추가 예문]
	
	```
	//Collection and Clousre 추가
	//String 배열의 정리, Sort함수.
	let names = ["Zeplin", "Banford", "Applejohn", "Cutford"]
	//ABC 순서로 하고 싶을때
	let arrangedNames = names.sorted()
	print(arrangedNames)
	
	//ABC 역순서로 하고 싶을때
	let arrangedNames2 = names.sorted { (a, b) -> Bool in
	    a > b }
	print(arrangedNames2)
	
	//Int, Double 타입을 필터링할 경우 filter 함수를 사용한다.
	var prices = [1.50, 10.00, 4.99, 2.30, 8.2]
	
	let largePrices = prices.filter({price -> Bool in
	    return price > 5
	})
	print(largePrices)
	
	//매핑을 활용한 클로져
	let salePrices = prices.map { (price) -> Double in
	    return price * 0.9
	}
	
	//리듀스 함수를 이용하여 전체 숫자를 더하여보자.
	let sum = prices.reduce(0, {result, price -> Double in
	    return result + price
	})
	
	print(sum)
	
	//각 가격별(key)로 몇개의 물건(value)을 보유하고 있는지를 나타내는 딕셔너리를 만들어보자
	var stock = [1.50: 5, 10.00: 2, 4.99: 20, 2.30: 5, 8.2: 30]
	//각 아이템별 전체 수량대비 현재 가지고 있는 수량에 대한 가격이 얼마나 되는지 알아보기 위해, reduce함수를 사용한다.
	let stockSum = stock.reduce(0) { result, pair -> Double in
	    return result + (pair.key * Double(pair.value))
	
	}
	print(stockSum)
	```

5) Programming in Swift : Structures

* [Structure](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/structures/structures-starter.playground/Contents.swift)
* [Protocol](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/protocols/protocols-starter.playground/Contents.swift)
* [Properties](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/Properties/Propeties.playground/Contents.swift)
* [Methods](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/Methods/methods.playground/Contents.swift)

6) Programming in Swift : Class

* [Class](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/class/classes-vs-structures.playground/Contents.swift)
* [Class-practice](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/class/challenge-classes-vs-structures-starter.playground/Contents.swift)
* [Class-inheritance](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/class/inheritance-starter.playground/Contents.swift)
* [Class-initializers](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/class/initializers-starter.playground/Contents.swift)
* [Memory Management](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/class/memory-management-starter.playground/Contents.swift)

###Part4 - TableView & MVC pattern

1. TableView

 1) 학습할 내용
	- Todo List App Design
	- TableView 만들기
	- TableView에 Cell만들기
	- Protocol & Delegate
	- TableView에 Rows 추가하기
	- Cell에 액세서리 추가하기
	- Delegate Method를 실행하기

 2) 실습 내용정리
 
 	* 실습 정리자료(Git) : Swift_Learning/01_Tutorials/02_Checklists/Checklists/
 
	* TableView에 대한 기본적인 내용 <br>
	:TableView의 경우, 컬럼이 없고, rows가 있다. 
	 Cell이 재사용된다.

	* MVC Pattern <br>
	: Model - Data 가 집합되어 있는 장소(요리 : 레시피)<br>
	  View - 사용된 Data들이 보여지는 곳(레이블, 버튼, 화면구성 등)<br>
	  Controller - Data와 View가 적절하게 상호 작용 할 수 있도록, 제어해주는 곳(ViewController, TableviewController etc,,)<br>
	
	* Code Refactoring<br>
	: Code Refactoring 하기에 앞서 작성한 코드가 중복이 되어 있는지 확인한다.<br>
	  메서드의 경우, 하나의 메서드에 과중한 역할이 들어가지 않도록 하고, 그럴 경우, 분할하여 준다.<br>
	  Model 클래스 내의 데이터를 여러군데에서 사용할 경우, 클래스 내에서 메서드를 작성하여 다른곳에서도 접근이 용이하도록 만들어 준다.<br>

2. TableView - Add and Delete Items

 1) 학습할 내용
 	- Navigation Controllers
 	- Adding New Items
 	- Swipe to delete
 	- Add a new screeen
 	- Static cells
 	- Text fields & the first responder

 2) 실습 내용 정리
 
 	- 네비게이션 컨트롤러 기본조작
 	- 네비게이션 컨트롤러에 bar button Item 추가
 	- 액션 버튼 활성화 및 TableView에 row 추가
 	- row에 삭제액션 및 삭제 콛 진행
 	- UITextField Delegate 사용
 	- 키보드의 리턴(Done) 버튼을 눌렀을때, 키보드를 숨기는 역할을 하는 메서드 구현

3. TableView - Editing Items

 1) 학습할 내용
 	- Delegate / Protocol
 	- Segues
 	- Detail Disclosure Indicator
 	- Pass data in segues
 	- NSObject
 	- Xcode refactoring tools

  2) 실습 내용 정리
  
  	- delegate / protocol 의 코드 구현(구현부 / 실행부)
  	- Segue활용을 통한 Add 기능 구현 및 Edit 기능 구현
  	- Edit 후에 적용된 셀에 구현되도록 코드 수정(NSObject)
  	- Code Refactoring

### Part5 - Saving Data & Parse Data(JSON)
1. Files and Data

 1) 학습할 내용
 
 	- [File Manager & URLs](https://github.com/Dynamic39/Swift_Learning/blob/master/01_Tutorials/Data%20Saving/Data%20Saving.playground/Contents.swift)
 	- [Image Data Load](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/Data%20Saving/Image%20Data.playground)
 
 2) 실습내용 정리
 
 	- Data를 FileManager를 통하여, path를 구성하고 data를 저장
 	- Bundle에 있는 data를 FileManager를 통하여 프로젝트 내, 새로운 폴더를 만들고 저장
 	- 이미지를 data로 변환하고, 해당 이미지를 가지는 path를 구성, data upload

2. JSON and Property List

 1) 학습할 내용
 
 	- [Codable](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/Data%20Saving)
	- [JSON](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/Data%20Saving)
 	- [Property List](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/Data%20Saving)


 2) 실습내용 정리
 
 	- Codable의 사용법
 	- JSON data 생성 방법
 	- Property List 생성 방법
 	- JSON vs Plist 	비교
 	- Encode / Decode
 
 3) 지속 학습 예정
 
 	- Filemanager 사용법
 	- Codable을 적용한 DataModel
 	- JSON data를 이용한 FireBase 관리


### Part5 - AutoLayout

1. Autoresizing & StackView & Constraints

 1) 학습할 내용
 
  	- Autoresizing
  	- Stack View
  	- Nesting StackView
  	- Constraints
  	- [참고링크](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/Autolayout)
 
 2) 실습내용 정리
 
 	- Xcode를 Interface를 활용한 auto-resizing
 	- Stack View를 사용하여, 프로퍼티를 하나 묶어서 오토 레이아웃 설정
 	- Stack View안에 또다른 Stack View를 사용하여 (Nesting StackView), 가로/세로 대응이 가능하도록 조정한다.
 	- width / heigt 의 고정값을 주는 것을 피한다.
 	- StackView와 Constraints 를 같이 사용하여 진행한다.

 	
### Part6 - Collection View

1. The Basics
 
 1) 학습할 내용

 	- TableView VS CollectionView
 	- Data Model
 	- UICollection View Protocols
 	- Cell Sizing and Spacing
 	- Responding to Selection
 	- Custom Collection View Cells
 	- Add and Delete Cells

 2) 실습내용 정리
 
 	- TableView와 다른점<br>
 	  : Grid에 Row와 Colums 보여진다.<br>
 	    수평/수직 구성이 가능하다.<br>
 	    추가 초기화 과정이 필요하다.<br>
 	    좀더 커스터마이징이 가능하고, 유연하다.<br>
 	    레이아웃 오브젝트와 분리된 레이아웃을 사용한다.<br>
 	- CollectionView의 기본 프로토콜 및 데이터 pass
 	- Prepare for segue 활용(identifier)
 	- CollectionView Editing CheckBox & CollectionViewCell Custom Class
 	- [참고링크]()
 
2. Customize CollectionView
 
 1) 학습할 내용
 
 	- Customizing Cells
 	- Adding Categories/Sections
 	- Moving Cells
 	- Data Model

 2) 실습내용
 
 	- Custom CollectionView
 	- DataModel분석 및 재작성, 주석 처리(작성 중..)
 	- 모르는 문법에 대한 재학습(convenience init) [참고링크](http://minsone.github.io/mac/ios/swift-initialization-summary)
 	- CollectionView FloyLayout, Animation effect
 	- Gesture : Moving cells
 	- [참고링크](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/CollectionView_Custom)

### Part7

1. ScrollView - Basic
 
 1) 학습할 내용
 
 	- Frames and bounds
 	- Custom Scroll Views
 	- Zooming
 	- Centering
 	- Scroll Views and Auto Layout
 	- Scroll Views and Stack Views
 
 2) 실습내용
 	
 	- Frame과 bounds 의 차이
 	- UIView를 이용한, 간단한 Sample Code 작성
 	- ScrollView Size와 image의 bounds의 사이즈를 비교하여, 기기 사이즈에 따른 zoom을 설정한다.
 	- ScrollView AutoLayout
 	- [참고링크](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/ScrollView)
 
2. ScrollView - Intermediate

 1) 학습할 내용
 
 	- Embedding Layouts
 	- ScrollView in ScrollView
 	- ScrollView inset
 	- Paging ScrollViews

 2) 실습 내용
 
 	- ScrollView in ScrollView 진행
 	- UIView 안에 다른 ViewController를 설정, 그안에 ScrollView를 삽입하여 진행
 	- Inset, Padding, ScrollView Contents Inset 설정방법
 	- Keyboard Inset
 	- viewcontroller 생성 및, page controll
 	- [참고링크](https://github.com/Dynamic39/Swift_Learning/tree/master/01_Tutorials/ScrollView)

 	

### Part8


 

  	
 
	 
	






## 참고자료
### FastCampus 수업 내용
### Ray Wenderlich 강의 내용
### Udemy Swift4 강좌 내용(Mark Price, Ray Wenderlich)