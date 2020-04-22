# While
```
조건문이 참일때 무조건 반복문이 실행되는 구조를 가지고 있다.
이렇기에 항상 거짓이 되는 부분을 넣어서 무한반복이 되는 것을 막아야 한다.
```
```swift
func limit(number: Int) {
    var i = 1
    while i <= 9 {
        print("\(number) * \(i) = \(number * i))
        i += 1
    }
}
limit(number:5)
```
* 위의 구조처럼 while을 사용할때는 한계치를 둬서 사용해야 한다.
* i <= 9 이렇게 i가 9를 넘을 수 없게 한계치를 두었다.

# repeat - while
```
while과의 차이는 repeat에서의 반복문이 실행이 되고 while 조건문을 확인하는 구조이다.
repeat에서 반복적으로 들어가는 조건을 주고 while에는 한계치를 걸어두는 것이 좋다.
repeat 아래 코드들이 실행이 되고 while 조건문을 확인하게 된다. 
이때, while 조건문이 참이되면 repeat위치로 다시 돌아가 반복하게 된다.
while 조건문이 거짓이 되면 그 아래 코드로 진행이 된다.
```
```swift
func soNumber(num: Int) {
    var i = 1
    var e = 0
    repeat {
        e += i
        i += 1
    } while i <= num
    print(e)
}
soNumber(num: 10)
```
```
* 이해
repeat의 반복문에 먼저 들어가게 되면
1 + 0 = 1 되면서 처음 e는 1이 되게 된다.
1 + 1 = 2 가 while 조건문으로 넘어가게 되고 
2 <= 10 보다 작기 때문에 다시 repeat의 반복문으로 가게 된다.
2 + 0 = 2 두번째 e는 2
2 + 1 = 3
3 <= 10 이렇게 되면서 반복하게 되다가
i가 11이 되는 순간 repeat으로 반복을 멈추고 
print(e)로 들어가게 되서 
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55가 나온다.
```
* while의 조건이 false가 되면 그 다음 코드가 실행된다.
* while의 조건이 true이면 repeat으로 돌아가면서 반복하게 된다.

# Guard
```
guard <조건식 또는 표현식> else {
    <조건식 또는 표현식의 결과가 false일 때 실행될 코드>
}
```
```
* 후속 코드들이 실행되기 전에 특정 조건을 만족하는지 확인하는 용도로 사용.
* 특정 조건을 만족하지 않은 채로 후속코드를 실행하면 심각한 오류가 발생할 경우 전체 구문을 조기 종료하기 위한 목적으로 사용.
* guard는 항상 else와 같이 쓰인다.
* guard문의 조건식이 false 값이 나오면 else의 조건식이 실행된다.
* guard 조건식이 true면 다음 조건식이 실행된다.
```
```swift
// guard문 예시
func divide(base: Int) {

    guard base != 0 else {
        print("연산할 수 없습니다.")
        return
    }

    let result = 100 / base
    print(result)
}
```
```
* 예시 해석
나누기를 연산할때는 0이 사용될 수 없다는 점을 이용해 guard문을 만들었다.
guard base != 0 <- 이 부분은 0이 맞다면 false 아니면 true 입니다.
false가 되면 else 구문이 실행이 되고 return을 이용해 함수가 종료 됩니다.
true라면 guard문 밑의 코드가 실행이 되겟죠 !
```


# Optional
```
* 함축적인 개념
nil을 사용할 수 있는 타입과 없는 타입을 구분하고, 사용할 수 있는 타입을 가르켜 옵셔널 타입이라고 부른다.

* nil
1. '값이 없음' 을 의미하는 특수한 값
2. 정수 0 과 문자열 ""과는 다른 말 그대로 순수하게 아무 것도 없다는 것을 의미
3. 종종 문제가 발생했을 때 이를 의미하기 위해 사용

! Swift는 많은 부분에서 오류를 발생하는 대신에 nil값을 반환한다. 
  ㄴ nil 값으로 반환하려면 무조건 Optional 타입이어야 한다.

* 옵셔널 타입이란?
반환하고자 하는 값을 옵셔널 객체로 다시 한 번 감싼 형태
 ㄴ Int("123") -> Optional(123)
 ㄴ Int("안녕하세요") -> nil
 Optional(123), nil 두개 다 옵셔널 타입이다.
 실제 값이 Optional 타입으로 변환하는 것이 Optional Wrapping 이라 한다.
```
```
* Swift는 변수를 선언할때 non-Optional 값을 주어야 한다.
    ㄴ 변수를 선언 했으면 어떤 값을 주어야 한다.
    ex) Int형으로 선언한 변수에는 무조건 정수 타입이 들어가야 한다.

```
* Optional Binding
    ```
    if let 이나 if var 구문과 주로 같이 쓰임 (guard와도 쓰인다.)
    값이 들어가 있는지 아니면 nil 값인지 체크해 준다고 생각하면 좋다.
    ```
    ```swift
    func name (na: Sting) {
        print(na)
    }

    var yoName: String? = nil
    if let nono = yoName {
        print(nono)
    }
    ```
    ```
    * 이해
    위의 경우 출력되는 값이 없다.
    Optional Binding 이라는 것 자체가 값이 있는지 없는지 아니면 
    nil 값인지를 확인해 주는 것인데 nil 값이 들어 있다면 위 처럼 출력이 되지 않게 된다.
    이래서 체크해 준다고 생각하면 좋을 것 같다.
    ```
    ```swift
    var height: Int? = 170
    if let landing = height {
        if landing >= 160 {
            print("그래도 160은 넘지")
        }
    } //출력 > 그래도 160은 넘지

    var weight: Int? = nil
    if let pig = weight {
        if pig == pig, pig >= 70 {
            print("살 좀 빼자")
        }
    } //출력 > x
    ```
    ```
    * 이해
    위의 경우 처럼 Optional의 값이 있는지 없는지 파악하고 값이 있다면 출력을 해주고 
    값이 nil 이면 출력을 해주지 않는다. 
    이런 과정을 Optional Binding 이라고 하며 값을 
    확인해 주는 단계라고 생각하면 좋겠다.
    ```

# + Closure
```
* 클로저 표현식
{ (매개변수) -> 반환 타입 in
    실행할 구문
}
    1. func 생략
    2. 함수의 이름 생략

* Input, Output이 없는 경우
{ () -> () in
    print("클로저가 실행됩니다.")
}
    1. Input, Output이 없다는 것을 표시해야 함
    2. () 대신 Void 를 사용해도 된다.
    3. 한 줄로 작성해도 무방하다.

* 클로저 표현식에서 반환 타입이 있지만 생략된 경우와, 반환값이 아예 없어서 작성되지 않은
경우를 컴파일러가 구분할 때 모호한 기준이 생길 수 있습니다.
```
### * Closure 실행 방법
```swift
let f = { () -> Void in
    print("클로저가 실행됩니다.")
}
f()
```
```swift
({ () -> Void in
    print("클로저가 실행됩니다.")
})()
```
### * 매개변수가 있는 Closure
```swift
let c = { (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
}
c(1, "closure")

// 위의 구문을 더 간결하게 작성

({ (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
}) (1, "closure")
```
### * Syntax Optimization
```swift
var value = [1, 9, 5, 7, 3, 2]
// 순서대로 배열되지 않은 정수
func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}
value.sort(by: order)
// 정렬 함수인 sort(by:) 활용 순서대로 정렬
// 줄여 보자
value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    } else {
        return false
    }
})
// 또 줄여보자
value.sort(by: {(s1: Int, s2: Int) -> Bool in return s1 > s2 })
// 한 번 더
value.sort(by: {(s1: Int, s2: Int) in return s1 > s2 })
// repeat!
value.sort(by: {(s1, s2) in return s1 > s2 })
value.sort(by: { s1, s2 in return s1 > s2 })
value.sort(by: { $0 > $1 })
value.sort(by: > )
// 좀 신기해  이렇게까지 줄일 수 있다.
// 모든 경우 이렇게 줄 일 수 있는 것은 아니다.
```
### * Trailing Closure
* 함수의 괄호가 닫힌 후에도 인수로 취급되는 클로저
```swift
closureParamFunction() {
  print("Trailing closure - Implicit closure parameter name")
}
//closureParamFunction 뒤 () 괄호가 닫혔음에도 작동 가능
```
* 함수의 마지막 인수(Argument)에만 사용 가능하고 해당 인수명은 생략
```swift
func multiClosureParams(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

multiClosureParams(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

multiClosureParams(closure1: {
  print("inline")
}) {
  print("trailing")
}
// closure2가 생략되었다. 
```
# 객체지향 프로그래밍 (Object Oriented Programming)
* 프로그램을 어떻게 설계해야 하는지에 대한 개념이자 방법론
* 객체들을 통하여 각 객체와 그 관계들 간의 관계를 설정하는 것이 객체지향 프로그래밍이다.
* 기본 구성 요소로는 클래스, 객체, 메소드, 메시지 등이 있다.
```
클래스라는 개념 안에 있는 것이 객체이다.
붕어빵을 만드는 기계가 클래스이고, 붕어빵은 객체가 된다.
클래스는 공통 특징, 서술.
오브젝트는 

```
# Class & Struct(구조체)
* 클래스는 참조타입이다. 참조타입은 데이터를 전달할 때 값의 메모리 위치를 전달.
* Struct는 값타입이다. 값타입은 데이터 전달 시 값을 복사해서 전달.
* Swift에서는 클래스보다 구조체를 더 많이 활용하는 것 같다. 

### & 값타입이라는 것도 있다. 값타입에는 구조체, 열거형이 있다.
    구조체는 struct, 열거형은 enum 

## 구조체(struct) vs 클래스(class)
```
1. 공통점
    - 프로퍼티 : 변수나 상수를 사용하여 값을 저장하느 프로퍼티를 정의
    - 메소드 : 함수를 사용하여 기능을 제공하는 메소드 정의
    - 서브스크립트 : 속성값에 접근할 수 있는 방법을 제공하는 서브스크립트 정의
    - 초기화 블록 : 객체를 원하는 초기 상태로 설정해 주는 초기화 블록 정의
    - 확장 : 객체에 함수적 기능을 추가하는 확장 구문 사용 가능
    - 프로토콜 : 특정 형식의 함수적 표준을 제공하기 위한 프로토콜 구현 가능

2. 차이 (클래스는 할 수 있지만 구조체는 못하는 기능)
    - 상속 : 클래스의 특성을 다른 클래스에게 물려줄 수 있다.
    - 타입 캐스팅 : 실행 시 컴파일러가 클래스의 인스턴스의 타입을 미리 파악 및 검사
    - 소멸화 구문 : 인스턴스가 소멸되기 직전에 처리해야할 구문을 미리 등록 가능
    - 참조에 의한 전달 : 인스턴스가 전달될 때에는 참조형식으로 제공, 개수 제약이 없다.
```

# 프로퍼티 (Property)
* 클래스와 구조체를 구성하는 요소 중 하나.
* 3가지의 종류가 있다.
    ```
    ● Stored Property(저장 프로퍼티)
    ● Computed Property(연산 프로퍼티)
    ● Type Property(타입 프로퍼티)
    ```
## 저장 프로퍼티(Stored Property)
* 클래스 내에서 선언된 변수나 상수를 부르는 이름
* 프로퍼티 선언 시 초기값이 할당되지 않은 저장 프로퍼티는 반드시 옵셔널 타입으로 선언해야 한다.

    ㄴ 스위프트에서는 클래스의 프로퍼티에 값이 비어있으면 인스턴스를 생성할 때 무조건 nil값으로 초기화 하기 때문!
    
    초기값을 처음부터 할당해 준다면 옵셔널 타입으로 선언할 필요가 없다.
```swift
struct FixedLengthRange { // 구조체 

    var firstValue: Int //변수 저장 프로퍼티
    let length: Int //상수 저장 프로퍼티

}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// FixedLengthRange의 인스턴스 'rangeOfThreeItems'
rangeOfThreeItems.firstValue = 6
rangeOfThreeItems.length = 10//error! 상수 저장 프로퍼티라서 에러!
```
```swift
class FixedRengthRange { //클래스
    var firstValue: Int 
    let length: Int

    init(firstValue: Int, length: Int) {

    }
}
```
# + OOP 4대 특징 
## Abstraction (추상화)
* 관심 영역만 남기기, 중요한 부분 강조, 불필요 부분 제거
* 대상에 대한 관점, 목적에 따라 달라짐
## Encapsulation(캡슐화)
* 내부의 정보는 숨기고 사용하는 방법만 외부로 노출, 요구하는 내용만 보여줌.
* 연관된 상태, 행동을 묶음. 불필요 정보는 감춘다.
## Inheritance (상속)
* Class를 활용하여 상속
* 하나의 클래스 속성을 다른 클래스가 그대로 쓴다, 물려 받는다.
* 하나의 공통된 특성을 사용, 계속해서 상속 가능
```
* class 앞에 final을 붙여주면 상속이 되지 않는다.
```
## Polymorphism (다양성)
* 동일한 요청에 다르게 응답을 돌려준다.

# + 오버라이딩(Overriding)
* 자식클래스는 일반적으로 부모 클래스로부터 상속받은 프로퍼티나 메소드를 그대로 사용.
* 필요에 의해 부모클래스로부터 상속받은 프로퍼티나 메소드를 다시 구현하거나 재정의하여 사용.
* 상위 클래스에서 상속받은 메서드를 하위 클래스에 맞게 변경하는 과정.
* 오버라이딩한 내용은 자기 자신 또는 자신을 서브클래싱한 하위 클래스에만 적용.
```
즉, 자식 클래스에서 프로퍼티나 메소드의 내용을 변경한다고 해서 변경된 내용이 부모클래스에까지 적용되지 않는다.
```
* 특정 클래스에서 메소드를 오버라이딩했다면 이 클래스를 상속받는 하위 클래스들은 모두 수정된 메소드를 상속 받지만, 부모 클래스나 부모 클래스를 상속받은 다른 클래스는 기존 메소드를 그대로 사용.
```
Swift는 오버라이딩을 하려면 메소드나 프로퍼티의 선언 앞에 Override 키워드를 써야한다.
```
* 프로퍼티를 오버라이딩할 때는 상위 클래스에서 저장 프로퍼티였건, 연산 프로퍼티였건 관계없이 연산 프로퍼티의 형태로 오버라이딩해야 합니다.


