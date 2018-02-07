
//데이터 저장 기초
import Foundation
//try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
FileManager.documentDirectoryURL

//URL을 통하여, 기본 파일 및 path를 지정하여, data를 저장하는 공간을 만들 수 있다.
let mystertDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)


//URL을 기본으로 새로운 저장소를 만들어보자.
let challengeString = "low F#"
let challengeStringURL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
let challengeStringData = challengeString.data(using: .utf8)!
try challengeStringData.write(to: challengeStringURL, options: .atomic)
let savedChallengeString = try String(contentsOf: challengeStringURL)


//Data의 형태에 따른 차이르 알아보기위한 예제
let mysteryBytes: [UInt8] = [
    240,          159,          152,          184,
    240,          159,          152,          185,
    0b1111_0000,  0b1001_1111,  0b1001_1000,  186,
    0xF0,         0x9F,         0x98,         187
]

//데이터를 저장하는 형태로 변환하여 준다
let mysteryData = Data(bytes: mysteryBytes)
//데이터를 URL에 보내주는 작업을 한다.
try mysteryData.write(to: mystertDataURL)
//데이터를 불러오는 작업을 한다.
let savedMysteryData = try Data(contentsOf: mystertDataURL)
let savedMysteryBytes = Array(savedMysteryData)


// FileExtension을 이용한 저장
try mysteryData.write(to: mystertDataURL.appendingPathExtension("txt"))


let string = String(data: savedMysteryData, encoding: .utf8)!

let stringURL = FileManager.documentDirectoryURL
    .appendingPathComponent("string")
    .appendingPathExtension("txt")

stringURL.lastPathComponent

try string.write(to: stringURL, atomically: true, encoding: .utf8)
try String(contentsOf: stringURL)




