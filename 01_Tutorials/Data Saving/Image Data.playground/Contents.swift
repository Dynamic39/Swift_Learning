
import UIKit

//번들을 활용하여, 이미지를 저장하거나 가져올 수 있다.
let spaceSceneURL = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: "Scenes")![1]
spaceSceneURL.lastPathComponent

extension FileManager {

}

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes", "Stickers")
//documentDirectoryURL 을 활용하여 실제로 자료가 있는지 확인하여 준다.
FileManager.documentDirectoryURL

//저장한 PNG 이미지를 가져온다.
FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Stickers", imageName: "frog")

