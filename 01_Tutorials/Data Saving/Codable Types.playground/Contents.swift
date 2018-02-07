import UIKit

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes", "Stickers")

let name = "SamKyu Kang"
let birthday = DateComponents(calendar: .current, year: 1986, month: 7, day: 30).date!
let normalizedPosition = CGPoint(x: 0.3, y: 0.5)
let imageName = "cat"

let sticker = Sticker(name: name, birthDay: birthday, normalizedPosition: normalizedPosition, imageName: imageName)
sticker == sticker
sticker.image



