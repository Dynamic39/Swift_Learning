import Foundation

// Pythagorean Theorem 📐🎓
func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

struct Location {
  let x: Int
  let y: Int
}

struct DeliveryArea: CustomStringConvertible {
  var description: String {
    return """
      Area with center: x: \(center.x), y: \(center.y),
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

