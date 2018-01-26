
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

