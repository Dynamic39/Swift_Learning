import Foundation

//데이터와 관련된 메서트 프로퍼티등을 하나의 structure로 관리 할 수 있다.
//중복 데이터를 사용하는 곳에 적절히 사용할 수 있게 된다.
//데이터를 가질수 있는 인스턴스를 만들 수 있도록 해준다.

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea {
    let center: Location
    var radius: Double
    
    func distance(from source: Location, to target: Location) -> Double {
        let distanceX = Double(source.x - target.x)
        let distanceY = Double(source.y - target.y)
        return sqrt(distanceX * distanceX + distanceY * distanceY)
    }
    
    func contains(_ location: Location) -> Bool {
        let distanceToStore = distance(from: center, to: location)
        return distanceToStore < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        return distance(from: center, to: area.center) <= (radius + area.radius)
    }
}

//튜플로 변수 설정
//let restaurantLocation = Location(x: 2, y: 4)
//let restaurantRange = 2.5
//두가지 변수로 만들지 않고, 하나의 변수에 structure를 사용하여 설정할 수 있다.
let resutaurant = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)

//let otherRestaurantLocation = Location(x: 7, y: 8)
//let otherRestaurantRange = 1.5
let otherRestaurant = DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5)

let restaurants = [resutaurant, otherRestaurant]

// Pythagorean Theorem 📐🎓
// 튜플로 인자값 설정 및, 클로져를 이용할 수 있도록 파라미터 구성
func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

//중복되는 코드가 여러개 발생하기 때문에 복잡한 코드가 되어버린다. 그렇기 때문에, Structure로 관리를 해야한다.
func isInDeliveryRange(location: Location) -> Bool {
//  let deliveryDistance = distance(from: location, to: restaurantLocation)
//  let otherDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
//  return deliveryDistance < restaurantRange || otherDeliveryDistance < otherRestaurantRange
    
    //Structure를 활용하여, 더욱더 간단하게 코드를 작성 할 수 있다.
    for restaurant in restaurants {
    //Structure안에서 처리가 가능한, 코드의 경우, 메서드를 새로 만들어 진행 할 수 있다.
        if restaurant.contains(location) {
            return true
        }
    }
    return false
}

isInDeliveryRange(location: Location(x:3, y:4))
isInDeliveryRange(location: Location(x:5, y:4))
isInDeliveryRange(location: Location(x:8, y:8))

//데이터는 새롭게 갱신되는 것이 아닌, 처음 참조하였을때 값이 복사가 된다.
var a:Int = 5
var b = a

a = 10

let area1 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let area2 = DeliveryArea(center: Location(x: 5, y: 9), radius: 2.5)
area1.overlaps(with: area2)

let area3 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
let area4 = DeliveryArea(center: Location(x: 3, y: 5), radius: 2.5)
area3.overlaps(with: area4)


