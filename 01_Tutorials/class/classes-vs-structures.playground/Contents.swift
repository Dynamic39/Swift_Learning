/* 클래스와 struct의 차이
 
 1. 클래스의 경우 레퍼런스(참조) 타입니다.
   1) 참조타입의 경우, 값이 지정되어 있으면 그 값을 실제로 가지는 것이 아니라, 참조를 하여 그 값을 가지는 것이다.
 2. Struct의 경우 밸류(값) 타입이다.
 
 */

struct PersonStruct {
    var firstName: String
    var lastName: String
    
    var fullName:String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}


//클래스를 만드는 방법은 Struct를 만드는 방법과 비슷하다.
class PersonClass {
    var firstName: String
    var lastName: String
    
    var fullName:String {
        return "\(firstName) \(lastName)"
    }
    
    //클래스는 변경이 가능하기 때문에, mutating을 붙이지 않아도 된다.
    func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
    
    //초기화를 시켜줘야 클래스로서 동작이 가능하게 된다.
    init(firstName: String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

//Struct와 Class가 값이 바뀜에 따라 결과물이 어떻게 달라지는지 알아보도록 하자.
//1. Struct의 경우
var person1 = PersonStruct(firstName: "SamKyu", lastName: "Kang")
let person2 = person1

person1.firstName = "Bob"

//값 타입이기 때문에, 처음 지정될때의 값이 다르게 적용되어 있는 것을 확인 할 수 있다.
person1.firstName
person2.firstName

//2. Class의 경우

var person3 = PersonClass(firstName: "SamKyu", lastName: "Kang")
var person4 = person3

person3.firstName = "Bob"

//클래스의 경우 레퍼런스 타입이기 때문에 메모리를 참조한다 따라서, 클래스의 원래 값이 바뀌게 되면,
//참조하는 변수들의 값도 자동으로 바뀌게 된다.
person3.firstName
person4.firstName

//변수에 새로운 클래스를 인스턴스ㅗ 만들어 주게 되면, 새로운 참조값이 생기게 되므로 값이 다시 바뀌게 된다.
person4 = PersonClass(firstName: "Vicki", lastName: "Wenderlich")
//참조가 해제되게 되면 클래스의 참조영역이 없으므로 컴파일러에서 자동으로 해제시킨다.
person4 = person3
person4.firstName





