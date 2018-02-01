//초기화에 대하여 알아보자.

//Designated initializer 의 경우 슈퍼 클래스에서 즉각적으로 가져오는 것을 말한다.
//convenience initializer 의 경우, 같은 클래스내에서 또다른 이니셜라이저를 호출해야한다.
//convenience initializer 의 경우, 완벽하게 Designated initializer 를 호출해야 한다.


struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    //해당 클래스를 상속받는 어떤 클래스던지 초기화를 해줘야하는 것을 알려주기 위해, "required"를 붙여주기도 한다.
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    //미리 상속받을 클래스에서 편하게 쓸수 있도록 동 클래스를 받아 트랜스퍼 시켜주는 방식도 있다.
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
    
    //미리 상속받을 클래스에서 반드시 사용되어야 하는 아이템이다.
    required init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    
}

class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    
    //상속받은 클래스에 해당 프로퍼티가 초기화 되지 않았기 때문에, 컴파일 에러가 발생한다.
    var sports:[String]
    
    //새로운 프로퍼티를 초기화 하는 구문을 만들어준다.
    init(firstName:String, lastName:String, sports: [String]){
        //초기화를 진행할때는, 해당 클래스에서 먼저 초기화를 진행을 해야, 상속받은 클래스의 초기화로 진행 될 수 있으므로 순서에 주의해야한다.
        self.sports = sports
        //초기화를 하면 이전에 상속 받았을때, 시행했던 초기화도 실행될 수 있도록 코드를 작성해주어야 한다.
        super.init(firstName: firstName, lastName: lastName)
        //초기화를 하기 전에는 메서드를 진행할 수 없으므로, 초기화가 진행 된 후에 메서드를 실행하여 준다.
        recordGrade(Grade(letter: "P", points: 0, credits: 0))
    }
    
    //일종의 override와 같이 사용된다.
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
        
    }
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade) // Explain this
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        return failedClasses.count < 3
    }
}

