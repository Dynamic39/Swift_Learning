import UIKit

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes", "Stickers")

let scenes = [
  Scene(
    width: 700,
    hasReverseGravity: false,
    backgroundName: "Forest",
    stickers: [
      Sticker(
        name: "Catwarts",
        birthday: DateComponents(
          calendar: .current,
          year: 1014,
          month: 10,
          day: 7
        ).date,
        normalizedPosition: CGPoint(x: 0.27, y: 0.25),
        imageName: "castle"
      ),
      Sticker(
        name: "Professor Froggonagle",
        birthday: nil,
        normalizedPosition: CGPoint(x: 0.15, y: 0.65),
        imageName: "frog"
      ),
      Sticker(
        name: "Mr. Basilisk",
        birthday: DateComponents(
          calendar: .current,
          year: 2,
          month: 3,
          day: 17
        ).date,
        normalizedPosition: CGPoint(x: 0.7, y: 0.38),
        imageName: "coiled snake"
      )
    ]
  ),
  Scene(
    width: 700,
    hasReverseGravity: false,
    backgroundName: "Winterfence",
    stickers: [
      Sticker(
        name: "House Bark",
        birthday: nil,
        normalizedPosition: CGPoint(x: 0.8, y: 0.05),
        imageName: "castle"
      ),
      Sticker(
        name: "Doggh Snow",
        birthday: DateComponents(
          calendar: .current,
          year: 1209,
          month: 2,
          day: 15
        ).date,
        normalizedPosition: CGPoint(x: 0.2, y: 0.6),
        imageName: "dog"
      )
    ]
  ),
  Scene(
    width: 700,
    hasReverseGravity: true,
    backgroundName: "space",
    stickers: [
      Sticker(
        name: "Space Count Monkula",
        birthday: DateComponents(
          calendar: .current,
          year: 3006,
          month: 1,
          day: 1
        ).date,
        normalizedPosition: CGPoint(x: 0.7, y: 0.45),
        imageName: "space monkey"
      ),
      Sticker(
        name: "Castle Monkula",
        birthday: nil,
        normalizedPosition: CGPoint(x: 0.2, y: 0.2),
        imageName: "castle"
      )
    ]
  )
]

do {
  let scenesURL = URL(
    fileURLWithPath: "scenes",
    relativeTo: FileManager.documentDirectoryURL.appendingPathComponent("Scenes")
  )

    //JSON En/Decoder 복습
    //JSON 타입 설정
    let jsonURL = scenesURL.appendingPathExtension("json")
    //인코더 실행
    let jsonEncoder = JSONEncoder()
    //날짜에 대한 국제 규격 준수로 설정
    jsonEncoder.dateEncodingStrategy = .iso8601
    jsonEncoder.outputFormatting = .prettyPrinted
    //변수 생성후, 실행된 인코더에 코더블로 작성한 클래스를 넣어줌
    let jsonData = try jsonEncoder.encode(scenes)
    //생성된 변수를 실제 파일에 기재해줌.
    try jsonData.write(to: jsonURL)
    
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .iso8601
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonScenes = try jsonDecoder.decode([Scene].self, from: savedJSONData)
    
    //let
    
    //프로퍼티 리스트에 대해서 알아보자
    
    //프로퍼티 파일을 만듬
    let plistURL = scenesURL.appendingPathExtension("plist")
    //프로퍼티 리스르 Encoder 실행
    let propertyListEncoder = PropertyListEncoder()

    //JSON과 비교하기위하여 타입을 바꿔준다.
    propertyListEncoder.outputFormat = .xml
    
    //프로퍼티 리스트 데이터에 입력할 자료를 인코더를 통하여 변수로 생성
    let propertyListData = try propertyListEncoder.encode(scenes)
    //프로퍼티 파일에 기재
    try propertyListData.write(to: plistURL)
    
    //디코더 실행
    let propertyListDecoder = PropertyListDecoder()
    //디코드할 경로를 가져옴
    let savedPropertyData = try Data(contentsOf: plistURL)
    //디코더 안에 있는 모든 배열의 값을 가지고 온다.
    let plistScenes = try propertyListDecoder.decode([Scene].self, from: savedPropertyData)

    plistScenes == jsonScenes
    plistScenes.map {$0.view}
    
    
  
}
catch {print(error)}

FileManager.documentDirectoryURL













