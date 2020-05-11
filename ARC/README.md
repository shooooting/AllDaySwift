# ARC

```swift
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

```
```swift
```swift
import UIKit

final class MemoryViewController: UIViewController {
  
  final class Person {
    var apartment: Apartment?
    let name: String
    
    init(name: String) {
      self.name = name
    }
    deinit {
      print("\(name) is being deinitialized")
    }
  }
  
  final class Apartment {
    var tenant: Person?
    let unit: String
    
    init(unit: String) {
      self.unit = unit
    }
    deinit {
      print("Apartment \(unit) is being deinitialized")
    }
  }
  
  var person: Person? = Person(name: "James")
  var apartment: Apartment? = Apartment(unit: "3A")
  
  func loadClass() { // 여기에서의 관계를 끊어줘야 함!
    person?.apartment = apartment 
    apartment?.tenant = person
  }
  
  deinit {
    print("MemoryViewController is being deinitialized")
  }
}

var memoryVC: MemoryViewController? = MemoryViewController()
memoryVC?.loadClass()
memoryVC?.apartment?.tenant = nil
//memoryVC?.person?.apartment = nil
memoryVC = nil

// weak 을 사용해서 count 값이 증가하지 않게 되서 바로  memoryVC = nil 로 끊어 버릴 수 있다.

//memoryVC?.apartment?.tenant = nil
//memoryVC?.person?.apartment = nil
//memoryVC = nil

/***************************************************
 1. 문제가 있는지 없는지 확인
 2. 문제가 없다면 참조카운트가 어떻게 바뀌면서 잘 해결이 되었는지 정리하고
    문제가 있다면 어떤 부분이 그런지 알아보고 직접 해결해 볼 것
 ***************************************************/
```
```
memoryVC?.loadClass() 이 부분에서의 관계를 끊어줘야 한다. 그래서 memoryVC?.apartment?.tenant = nil 이렇게 하나를 끊어 주면 다음에 memoryVC = nil 이렇게 선언하면 해제가 된다. 아니면 연결되는 고리인 값 중에 하나에 weak을 사용하면 count를 증가 시키지 않기 때문에 memoryVC = nil만 사용해도 된다.  
```