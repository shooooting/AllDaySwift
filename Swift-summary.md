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

