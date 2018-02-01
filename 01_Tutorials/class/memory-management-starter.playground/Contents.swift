//메모리 관리에 대해서 알아보자.
//ARC(Auro Reference Counting)

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is being removed from memory")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    //weak를 붙여줌으로써, 순환참조를 막을 수 있다
    weak var partner: Student?
    
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
    
    required init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    
    deinit {
        print("\(firstName) is being deallocated")
    }
    
}


//Swift의 메모리 관리가 어떻게 이루어지는지 알아보도록 하자.

var someone = Person(firstName: "Johnny", lastName: "Appleseed") // Single Ref를 가진다, counting = 1
var anotherSomeone:Person? = someone // 현재 someone instance 로 또하나의 변수가 생성되여 Ref를 가졌으므로, 현재 counting = 2
var lotsOfPeople = [someone, someone, anotherSomeone, someone] // 현재 RC(reference count)는 6개이다. 동일한 위치를 6개의 인스턴스가 참조하고 있다.

anotherSomeone = nil
lotsOfPeople = [] // 43, 44가 실행되면서 RC가 다 빠져버리게 된다 이때 counting = 1
print("Here 1")

// 현재 제일 처음 인스턴스를 만든 Person(firstName: "Johnny", lastName: "Appleseed") counting = 0 이 되었으므로 메모리에서 삭제되고 하기 작성한 코드로 새로운 인스턴스가 생성된다.
someone = Person(firstName: "Jill", lastName: "Appleseed")
print("Here 2")

var alice: Student? = Student(firstName: "Alice", lastName: "Appleseed")
var bob: Student? = Student(firstName: "Bob", lastName: "Appleseed")

//순환 참조가 되기 때문에, 필요가 없어진 상황에도 불구하고, 인스턴스가 삭제되지 않는다.
alice?.partner = bob
bob?.partner = alice

alice = nil
bob = nil


