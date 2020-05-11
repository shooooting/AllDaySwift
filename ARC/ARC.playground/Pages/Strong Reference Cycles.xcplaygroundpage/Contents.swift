//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
    func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person() // count 1
var tory: Dog? = Dog() // count 1

giftbot?.pet = tory // dog - count 2
tory?.owner = giftbot // person - count 2

// 순서 주의

giftbot?.pet = nil // dog -count 1
tory?.owner = nil // person - count 1

giftbot = nil // person - count 0
tory = nil // dog - count 0

// 안에 있는 내용을 먼저 nil로 만들어주고 밖에 것을 nil로 만들어 줘야 한다.

//giftbot = nil // person - count 1
//tory = nil // dog - count 1

//giftbot?.pet = nil // 위에 giftbot = nil 선언을 먼저하고 나중에 giftbot?.pet을 하면 이렇게하면 nil.pet이 되는 거다.
// var 로 giftbot 이랑 tory로 접근햇는데 두 개를 없애 버려서 접근을 할 수 없게 되어 사라지지 않는다.


/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */



/*:
 ---
 ### Answer
 ---
 */
// 순서 주의

giftbot?.pet = nil // dog -count 1
tory?.owner = nil // person - count 1

giftbot = nil // person - count 0
tory = nil // dog - count 0

// 안에 있는 내용을 먼저 nil로 만들어주고 밖에 것을 nil로 만들어 줘야 한다.



//: [Next](@next)
