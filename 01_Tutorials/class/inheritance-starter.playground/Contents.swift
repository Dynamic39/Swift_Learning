//클래스의 상속(inheritance)에 대해서 알아보자

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

//Person 클래스와, Student클래스가 비슷한 프로퍼티를 가지고 있음을 알 수 있다.
//중복된 코드는 최대한 정리를 해주는 것이 중요하기 때문에, 여기서 상속을 사용 할 수 있다.
class Person {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

//Person에 있는 프로퍼티를 가지고 오기 위하여, 해당 클래스를 가지고 온다.
class Student : Person {
//동일한 코드들은 지워줘도 된다.
//  var firstName: String
//  var lastName: String
//  init(firstName: String, lastName: String) {
//    self.firstName = firstName
//    self.lastName = lastName
//  }
    
    var grades: [Grade] = []
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

//서로 다른 클래스를 가지고 초기화를 진행하였으나, Student클래스의 경우, Person클래스의 초기화 룰을 그대로 따르고 있다
let john = Person(firstName: "John", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

//프로퍼티들도 잘 상속되어, 인스턴스로 생성이 된 모습을 확인 할 수 있다.
john.firstName
jane.firstName


let history = Grade(letter: "B", points: 9.0, credits: 3.0)

//jane만이 student class를 인스턴스로 가지고 있으므로, 해당 프로퍼티를 사용 할 수 있다.
jane.recordGrade(history)

//BandMember라는 새로운 클래스를 생성하여 보자.
//이경우, Student가 상속받은 모든 클래스를 같이 상속 받는다.
class BandMember: Student {
    var minimunPracticeTime = 2
}

class OboePlayer: BandMember {
    //상위 클래스의 프로퍼티를 재사용(편집) 하려면 override 를 앞에 붙인 후, 새로 작성할 수 있다.
    override var minimunPracticeTime: Int {
        get {
            return super.minimunPracticeTime * 2
        }
        set {
            super.minimunPracticeTime = newValue / 2
        }
    }
}

func phonebookName(_ person: Person) -> String {
    return "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Ray", lastName: "Wenderlich")
let oboePlayer = OboePlayer(firstName: "Vicki", lastName: "Wendelich")

phonebookName(person)
phonebookName(oboePlayer)

var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeel")
hallMonitor = oboePlayer
//상위 클래스로 업캐스팅 할 수 있다.
(oboePlayer as Student).firstName

//다운캐스팅도 가능하다.
let oboe2 = hallMonitor as? OboePlayer // ! 로 바꾸게 되면, 해당 클래스가 반드시 존재해야 한다. 크래시의 위험이 있다.
if let oboe2 = oboe2 {
    print(oboe2.minimunPracticeTime)
} else {
    print("Not an oboe player")
}

class StudentAthlete: Student {
    
    //새로운 프로퍼티 추가
    var failedClasses: [Grade] = []
    
    //오버라이드 하여, 메서드도 재작성
    override func recordGrade(_ grade: Grade) {
        //super.메서드명을 입력하여, 이전의 특징을 그대로 가져온후, 새로운 코드를 작성 할 수 있다.
        super.recordGrade(grade)
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        return failedClasses.count < 3
    }

}

var athlete = StudentAthlete(firstName: "Jon", lastName: "Snow")
athlete.recordGrade(Grade(letter: "F", points: 0, credits: 0))
athlete.isEligible
athlete.recordGrade(Grade(letter: "F", points: 0, credits: 0))
athlete.recordGrade(Grade(letter: "F", points: 0, credits: 0))
athlete.recordGrade(Grade(letter: "F", points: 0, credits: 0))
athlete.isEligible


