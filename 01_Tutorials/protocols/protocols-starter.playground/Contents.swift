import Foundation

//프로토콜에 대해서
//프로토콜은 해야할 일들을 정리하거나, 컨트롤 할 수 있게 미리 만들어져 있다.
//기본적으로 Swift에서 사용할 수 있는 프로토콜을 사용하여 샘플 코드를 만들어 보도록 한다.

struct Location {
  let x: Int
  let y: Int
}

// Pythagorean Theorem 📐🎓
func distance(from source: Location, to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return sqrt(distanceX * distanceX + distanceY * distanceY)
}

//프로토콜을 채택하기 위한, Structure를 선택한다.
struct DeliveryArea: CustomStringConvertible {
    //프로토콜에서 적용해야한 필수 요건이 자동으로 작성될 수 있게 되었다.
    //Computed 프로퍼티를 사용하여, 값을 넣어 줄 수 있다.
    var description: String {
        return """
        Area with center: x: \(center.x), y: \(center.y)
        radius \(radius)
        """
    }
    
  let center: Location
  var radius: Double

  func contains(_ location: Location) -> Bool {
    let distanceToStore = distance(from: location, to: center)
    return distanceToStore < radius
  }

}

let restaurant = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let otherRestaurant = DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5)
let restaurants = [restaurant, otherRestaurant]

for restaurant in restaurants {
    print(restaurant)
}

func isInDeliveryRange(location: Location) -> Bool {
  for restaurant in restaurants {
    if restaurant.contains(location) {
      return true
    }
  }
  return false

}

isInDeliveryRange(location: Location(x: 3, y: 4))
isInDeliveryRange(location: Location(x: 5, y: 4))
isInDeliveryRange(location: Location(x: 8, y: 8))

var a: Int = 5
var b = a
print(a)
print(b)

a = 10
print(a)
print(b)

var area1 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let area2 = area1
area1.radius = 3.5
print(area1.radius)
print(area2.radius)

