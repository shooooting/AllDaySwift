//: [Previous](@previous)
/*:
 ---
 # Scope
   - 스코프 범위에 의한 할당 및 해제
 ---
 */


class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
  var prop = ClassProperty() // class가 사라질때 같이 사라짐. optional로 타입을 줘서
  
  func allocateInstance() {
    let local = LocalScope() // count 1
    local.doSomething() // count 0
  } // 메소드 allocateInstance 끝나고 let local 변수는 사라짐.
  
  deinit {
    print("Application is being deinitialized")
  }
}


// Q. 아래의 코드 실행 시 출력되는 메시지는?

var app: Application? = Application()
app?.prop.doSomething()
app?.allocateInstance()



// Q. ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요?
app = nil
// 함수는 그 함수가 끝나면 없어짐 class는 nil로 해서 없애줘야 함


//: [Next](@next)
