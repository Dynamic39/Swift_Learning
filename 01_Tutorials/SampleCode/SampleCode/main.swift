//Set이란? 유니크한 값을 가지는 형태로 중복되지 않은 형태로 가지고 있는 것을 말한다.

var someSet:Set<Int> = [1, 2, 3, 1]
print(someSet) // 중복되는 값을 없어지므로, [2, 3, 1] 만 프린트된다.
print(someSet.contains(1)) // 값이 있으므로, true값이 반환된다.
print(someSet.contains(99)) // 값이 없으므로 false 값이 반환된다.
someSet.insert(5)
print(someSet)
someSet.remove(3)

