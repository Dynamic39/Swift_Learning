
//데이터 저장 기초

import Foundation

try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

FileManager.documentDirectoryURL
