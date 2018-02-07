import UIKit

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes", "Stickers")



let stickers = [
    Sticker(
        name: "David Meowie",
        birthday: DateComponents(
            calendar: .current,
            year: 1947, month: 1, day: 8
            ).date!,
        normalizedPosition: CGPoint(x: 0.3, y: 0.5),
        imageName: "cat"
    ),
    Sticker(name: "SamKyu Kang",
            birthday: DateComponents(calendar: .current, year: 1986, month: 7, day: 30).date!,
            normalizedPosition: CGPoint(x: 0.7, y: 0.5),
            imageName: "rocketmouse")
    
]
FileManager.documentDirectoryURL

//JSON 파일에 대하여 알아보자.
//do catch 문을 사용하여 진행한다.

do {
    //JSON Encoder
    let jsonURL = URL(fileURLWithPath: "stickers", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent("Stickers")).appendingPathExtension("json")
    let jsonEncoder = JSONEncoder()
    //JSON형식이 조금더 잘 보일 수 있도록 코드를 추가해준다.
    jsonEncoder.outputFormatting = .prettyPrinted
    //JSON데이터로 변환하여 인코딩을 시작한다.
    let jsonData = try jsonEncoder.encode(stickers)
    try jsonData.write(to: jsonURL)
    
    //JSON Decoder
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonStickers = try jsonDecoder.decode([Sticker].self, from: savedJSONData)
    jsonStickers == stickers
    
    jsonStickers.map{ $0.image }

//에러일 경우 캐치문이 실행된다.
} catch {
    print("Error")
}

//파일 매니저에 정사애적으로 JSON파일이 생성된 것을 확인 할 수 있다.
FileManager.documentDirectoryURL

