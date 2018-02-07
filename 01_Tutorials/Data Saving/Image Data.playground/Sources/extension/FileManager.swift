import UIKit

public extension FileManager {
  static var documentDirectoryURL: URL {
    return try! FileManager.default.url(
      for: .documentDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: false
    )
  }
    static func copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: String...) throws {
        for subdirectoryName in subdirectoryNames {
            let documentSubdiretoryURL = URL(fileURLWithPath: subdirectoryName, relativeTo: FileManager.documentDirectoryURL)
            
            //디렉토리가 만들어지지 않았기 때문에 각각의 서브디렉토리에 해당하는 폴더를 만들어 준다.
            //트라이를 사용하는 이유는, 디렉토리가 없을 경우 생성을 해야 하기 때문이다.
            try? FileManager.default.createDirectory(at: documentSubdiretoryURL, withIntermediateDirectories: false)
            
            //옵셔널 해제를 통하여, 이미지가 있는지 확인한다. 값이 없을 수도 있으므로, return값이 아닌, continue값을 준다.
            guard let pngURLs = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: subdirectoryName) else {continue}
            for pngURL in pngURLs {
                let data = try Data(contentsOf: pngURL)
                try data.write(to: documentSubdiretoryURL.appendingPathComponent(pngURL.lastPathComponent), options: .atomic)
                
            }
        }
    }
    
    //이미지 path안에 있는 다른 이미지를 불러오기 위하여, 메소드를 작성하여 준다.
    //이미지를 업로드 하기 위하여 path data를 가져온다.
    static func getPNGFromDocumentDirectory(subdirectoryName: String, imageName:String) -> UIImage? {
        return UIImage(contentsOfFile: FileManager.documentDirectoryURL.appendingPathComponent(subdirectoryName).appendingPathComponent(imageName).appendingPathExtension("png").path)
        
    }
}
