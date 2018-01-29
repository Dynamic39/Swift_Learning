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









