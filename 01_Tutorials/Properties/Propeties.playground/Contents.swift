//프로퍼티에 대해서 알아보자
//프로퍼티는 연산프로퍼티와 저장프로퍼티로 나뉜다.

struct Person {
    //저장 프로퍼티는 그 자체로 값을 가질 수 있다.
    var firstName:String {
        didSet {
            if let spaceIndex = firstName.index(of: " ") {
                //공백이 있는 경우, 새로운 값이 아닌, 이전값으로 되돌리는 작업을 진행한다.
                print("No spaces allowed! Reverting change.")
                firstName = oldValue
            } else {
                print("The value of firsName changed from \(oldValue) to \(firstName)")
            }
        }
    }
    var lastName:String
    
    //연산 프로퍼티는 기본적으로 변수(var)를 사용하여 진행한다.
    //프로퍼티내에서 어떠한 연산작업 후, 리턴 값을 반환한다.
    //하기의 샘플의 경우 read-only 연산 프로퍼티이다.
//    var fullName:String {
//        return "\(firstName) + \(lastName)"
//    }
    var fullName:String {
        get {
        return "\(firstName) \(lastName)"
        }
        set {
            //fullName에 공란이 있을 경우, 앞뒤를 기준으로 firstName과 lastName을 세팅해줄 수 있다.
            if let spaceIndex = newValue.index(of: " "){
                firstName = String(newValue[..<spaceIndex])
                lastName = String(newValue[newValue.index(after: spaceIndex)...])
            }
        }
    }
    
    //Type Property
    static var outOfWedlock = "Snow"
    
    //지연 프로퍼티 : 사용자가 호출할때, 인스턴스가 생성되는 프로퍼티
    lazy var isAlive : Bool = {
        print("Checking life...")
        if fullName == "Waymar Royce" {
            return false
        } else {
            return true
        }
    }() // 클로져 형식으로 작성되며, 실제로 불리기 전까지 실행되지 않는다.
    
    
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
}

var person = Person(firstName: "SamKyu", lastName: "Kang")

person.firstName = "Vicki"
let vicki = person.firstName

person.lastName = "Coulter"

person.fullName
person.fullName = "Ben Morrow"
person.firstName
person.lastName

person.lastName = Person.outOfWedlock
person.fullName

person.firstName = "John Snow"
person.fullName

print("Here 1")

person.isAlive

var person2 = Person(firstName: "Waymar", lastName: "Royce")
person2.isAlive
