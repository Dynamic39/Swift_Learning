//String

var name = "Sam Kyu"

let message = "Hello, my name is \(name)"
print(message)
let message2 = name + "Kang"
print(message2)
let message3 = "Hello\nGoodbye"
print(message3)

let massage4 = """
This
is
a
long
message
"""
print(massage4)

//String 의 Character별로 나눌수 있다.
for char in name {
    print(char)
}

//String의 Character개수를 알수 있다.
let strLen = name.count
//let secondChar = name[1]  //컴파일 에러 발생, String의 경우, 인덱스를 바로 참조하는 것이 아닌 unicode형태로 제공된다.

let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

print(cafeNormal.count)
print(cafeCombining.count)

print(cafeNormal.unicodeScalars.count)
print(cafeCombining.unicodeScalars.count)

let firstIndex = cafeCombining.startIndex
let firstChar = cafeCombining[firstIndex]


