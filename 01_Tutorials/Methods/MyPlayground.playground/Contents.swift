import Foundation

//Method에 대해서

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

//Structure를 만든다.
struct SimpleDate {
    var month: String
    var day: Int
    
    //type 프로퍼티를 사용해보자
    static var firstDayOfMonth = 1
    
    //안에 만듬으로서 필요없는 인자들을 삭제 할 수 있다.
    func monthUntilWinterBreak() -> Int {
        return months.index(of: "December")! - months.index(of: month)!
    }
    
    // 초기화 하고 싶은 것이 있을 경우 사용한다.
    // 이경우는 무조건 해당값을 가지기 때문에, 다른 값이 들어가지 못한다.
//    init() {
//        month = "January"
//        day = 1
//    }
    
    //기본적으로 스트럭쳐의 값은 바뀌지 않는다.
    //값 타입이기 때문에, 프로퍼터의 값을 바꾸기 위해선 mutating을 붙여서 값이 바뀔 수 있음을 알려줘야 한다.
    mutating func advance() {
        day += 1
    }
    
    //다른값이 들어 갈 수 있도록 만들어주는 초기화
//    init(month: String, day: Int) {
//        //파라미터 값과, 프로퍼티 값이 같은경우, 프로퍼티 값 앞에 self.을 붙여줌으로써 두 객체가 다름을 표기해 주어야 한다.
//        self.month = month
//        self.day = day
//    }
}

extension SimpleDate {
    
    init() {
        month = "January"
        day = 1
    }
    
}

struct Math {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1) { result, number in
            return result * number
        }
    }
}

Math.factorial(of: 6)

//extension을 이용하여, Struct에 추가로 사용가능하다.
extension Math {
    static func length(x: Double, y:Double) -> Double {
        return sqrt(x*x + y*y)
    }
}

Math.length(x: 3, y: 4)


var testDate = SimpleDate(month: "February", day: 22)
testDate.monthUntilWinterBreak()
testDate.advance()
testDate

SimpleDate.firstDayOfMonth

var otherDate = SimpleDate()
