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


// 메서드를 활용한 학점 structure만들기

struct Student {
    let firstName:String
    let lastName:String
    var grade:Double
}

struct Classroom {
    let className:String
    var students:[Student]
    
    //가장 높은 점수가 무엇인지 판별하는 메서드를 만든다.
    func highestGrade() -> Double {
        return students.reduce(0) { result, student in
            return student.grade > result ? student.grade : result
        }
    }
}

var ray = Student(firstName: "Ray", lastName: "Wendelich", grade: 60)
var vicki = Student(firstName: "Vicki", lastName: "Wendelich", grade: 95)

var classroom = Classroom(className: "Photoshop for Dummies", students: [ray, vicki])

classroom.highestGrade()

//extension을 활용하여, 새로운 메서드를 만들어준다.

extension Classroom {
   mutating func curveGrades() {
        let curveAmount = 100.0 - highestGrade()
        for i in 0..<students.count {
            students[i].grade += curveAmount
        }
    students.sort { (student1, student2) -> Bool in
        return student1.grade > student2.grade
    }
    }
}

classroom.curveGrades()
classroom.students[0].grade
classroom.students[1].grade

//프로토콜을 활용하기 위하여 익스텐션을 추가로 구성한다.
extension Student:CustomStringConvertible {
    
    //해당 프로토콜에서 채택해야 하는 프로퍼티로 해당 프로퍼티가 필수로 들어가 있어야 한다.
    var description:String {
        return "\(lastName), \(firstName) : \(grade)"
    }
}

//for student in classroom.students {
//    print(student)
//}

extension Classroom: CustomStringConvertible {
    var description: String {
        var retval = ""
        retval += "\(classroom.className)\n"
        for student in students {
            retval += "\(student)\n"
        }
        return retval
    }
}

print(classroom)














