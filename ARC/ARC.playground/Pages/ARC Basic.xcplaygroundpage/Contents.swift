//: [Previous](@previous)
/*:
 # ARC Basic
 */

class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}


/*:
 ---
 ### case 1. Allocation & Release
 ---
 */
print("\n---------- [ Case 1 ] ----------\n")

var obj1: Person? = Person(testCase: "case1") // 만들어 질때 count 1

obj1 = nil // count 0 위에서 만들어 지고 count 0 이 되면서 해제가 된다.


/*:
 ---
 ### case 2. 참조 카운트 증가
 ---
 */
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2") // count 1
var countUp = obj2 // count 2

obj2 = nil // count 1

countUp = nil // count 0 여기서 count 0 이 되면서 해제가 된다.


/*:
 ---
 ### case 3. Collection 에 의한 참조 카운트
 ---
 */
print("\n---------- [ Case 3 ] ----------\n")


var obj3: Person? = Person(testCase: "case3") // count 1
var array = [obj3, obj3] // count 3

obj3 = nil // count 2

array.remove(at: 0) // count 1

array.remove(at: 0) // count 0 이렇게 되어야 count 0 이 되면서 해제가 된다.

// Array에 서로 다른 변수가 들어가면 각각의 변수마다 count를 갖게 된다.
// 각각의 변수의 count가 없어져야 사라진다.

/*:
 ---
 ### case 4. 강한 참조, 약한 참조
 - strong : 기본값. 강한 참조. Reference Count 1 증가
 - unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 ---
 */
//strong으로 명시를 안해줘도 기본값이라 그냥 들어감

print("\n---------- [ Case 4 ] ----------\n")

var strongObj4 = Person(testCase: "case4") // count 1
print(strongObj4)


weak var weakObj4 = Person(testCase: "case4") // 약한 참조라 count 0 만들자 마자 바로 없어짐
print(weakObj4) // nil 이 들어감 weak 이라 할당 안되고 바로 없어짐

//unowned var unownedObj4 = Person(testCase: "case4") // count 0 이 할당 만들어지자마자 없어짐 (오류가 발생한다.)
//print(unownedObj4) 기존 주소는 그대로 남아 있으므로 Err가 발생 .
//unowned 절대로 해제되지 않을때만 사용해야 한다.
//weak은 값이 있더라도 optional


//weak var weakobj4 = strongObj4
//print(weakobj4) optional으로 나옴
//
//unowned var unownedobj4 = strongObj4
//print(unownedobj4) optional이 벗겨져서 나온다.

/***************************************************
 unowned. weak  -  let , var
 ***************************************************/

// 다음 4줄의 코드 중 사용 불가능한 것은?

//unowned let unownedLet = strongObj4
//unowned var unownedVar = strongObj4
//weak let weakLet = strongObj4 weak 일때는 항상 var로 선언해야한다.
//weak var weakVar = strongObj4


// unowned 와 weak 의 타입은?
//print("Unowned type: ", type(of: unownedVar)) optional이 벗겨짐 
//print("Weak type: ", type(of: weakVar)) optional 타입



//: [Next](@next)
