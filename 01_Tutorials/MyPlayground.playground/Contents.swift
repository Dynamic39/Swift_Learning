//Booleans에 대하여
//True or False인가를 식별하는 타입이다.

//타입추론이 되기 때문에, Bool을 빼고 기재해도 오류가 나지 않는다.
let yes:Bool = true
let no:Bool = false

//다음은 Boolean 값을 변수명으로 설정하여 표기한 에제이다.
let doesOneEqualTwo = (1 == 2)
let doesNotEqualTwo = (1 != 2)

let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

let and = true && true
let or = false || false || true

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

//예제
let guess = "cat"
let dogEqualsCat = guess == "dog"

let order = "cat" < "dog"
let a = 5
let b = 10

//a가 b 보다 작을 경우, a의 값을 반환해 주고 그렇지 않을 경우 "?" 마크를 사용하여, a에 대입해줄 숫자를 정한다.
//두가지 변수의 크기많을 비교하므로, a값에 b를 입력하여 준다.
let min = a < b ? a : b


