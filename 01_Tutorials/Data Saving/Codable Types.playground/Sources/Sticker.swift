import UIKit

//Codable 에 대하여 알아보자
public struct Sticker: Codable {
    
    //public 의 경우, 파일내에서만 사용할 수 있기 때문에 다른곳에서도 사용 할 수 있도록 로딩작업이 필요하다.
    public init(
        name:String,
        birthDay:Date?,
        normalizedPosition: CGPoint,
        imageName:String
        ) {
        self.name = name
        self.birthDay = birthDay
        self.normalizedPosition = normalizedPosition
        self.imageName = imageName
    }
    
    public let name : String
    public let birthDay: Date?
    public let normalizedPosition: CGPoint
    public let imageName: String
    
    public var image: UIImage? {
        return FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Stickers", imageName: imageName)
    }
}

//두 프로퍼티를 비교하는 프로토콜을 별도 채택하여, 메서드를 구성하여 준다.
extension Sticker: Equatable {
    public static func ==(sticker0: Sticker, sticker1: Sticker) -> Bool {
        return sticker0.name == sticker1.name
            && sticker0.birthDay == sticker1.birthDay
            && sticker0.normalizedPosition == sticker1.normalizedPosition
            && sticker0.imageName == sticker1.imageName
    }
}
