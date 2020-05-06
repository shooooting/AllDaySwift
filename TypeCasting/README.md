# Type Casting
```
타입캐스팅은 인스턴스의 타입을 확인하거나, 인스턴스의 타입을 슈퍼클래스 또는 서브클래스 타입처럼 사용하기위해 씁니다.
```
## Type Check (타입확인)

- Type(of:)
```swift
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])
```
```
anyArr[0]의 타입은 Any타입이 나오게 된다.
하지만 여기서 type(of:)를 사용하게 된다면 실제로 들어가 있는 타입이 출력된다. 

anyArr[0]은 컴파일 타임일때 확인하는 결과를 보여주기때문에 Any타입으로 출력된다. 그에 반해 type(of:)를 활용하게 되면 런타임때 출력되는 값이 보여진다.
```

- generic
```swift
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)
```
```
제네릭은 알아만 두는 걸로 하자!
여기서 T라는 곳에 타입의 값이 들어가게된다. 
출력이 되면 1 of type Int 이렇게 나온다.
이렇게 타입을 확인할 수 있다.
```

## 타입 비교
- is

    is 객체의 타입 -> Bool (true or false)

```swift
let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교


let strArr = ["A", "B", "C"]

if strArr[0] is String {
  "String"
} else {
  "Something else"
}
```
```
is 는 타입비교를 해준다고 생각하면 좋다.
Bool 타입으로 결과값이 나와서 if 문으로 돌아간다.
```

```swift
if strArr[0] is Int {
  "Int"
}
```
```
위의 if문은 strArr의 출력값은 String이고 비교하는 대상이 Int 값이기때문에 출력이 되지 않는다.
간단하게 설명해 보면 String은 Int냐? 라고 묻는거와 같다.
```
```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var zedd = Person(name: "Zedd")

if zedd is Person{
    print(true)
}
```
```
Person이라는 Class를 지정해 주었고, 초기값이 없으므로 init을 만들어 주었다.
zedd라는 변수를 선언을 한 부분을 보면 Person타입의 인스턴스인 zedd를 하나 선언했고,
zedd라는 인스턴스가 Person의 인스턴스냐? 라고 확인을 하고 있다.
이렇게 인스턴스도 확인할 수 있다. 위에서 보았듯이 인스턴스의 프로퍼티도 당연히 확인 가능하다.
```

## Upcasting
- 상속 관계에 있는 자식 클래스가 부모 클래스로 형을 변환하는 것.
- 업캐스팅은 항상 성공하며 타입 캐스트 연산자로 as를 사용한다.

```swift
class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

let rect = Rectangle()
rect.color
rect.cornerRadius

let t1 = rect as Shape
let t2 = rect as Rectangle

(rect as Shape).color
//(rect as Shape).cornerRadius shape 타입인데 cornerradius가 없어서 에러가 난다.

(rect as Rectangle).color
(rect as Rectangle).cornerRadius
rect.cornerRadius
rect.color



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //

upcastedRect.color
//upcastedRect.cornerRadius shape타입에 cornerRadius를 갖고 있지 않아서 에러가 뜸

(upcastedRect as Shape).color
//(upcastedRect as Rectangle).color as는 자기 자신이거나 부모클래스 일때만 사용!
```
```
타입을 변경을 할때 자식클래스가 부모클래스로 변경할 수 있는데 왜 그 반대는 안될까?
부모클래스는 자식클래스가 가지고 있는 것을 가지고 있지 않는 경우가 있기 때문에 성립되지 않는다.
위에서 보듯이 cornerRadius를 부모클래스가 가지고 있지 않았고 upcastedRect는 Shape 타입으로 선언 되어 있기때문이다.
저렇게 선언하면 런타임에서와 컴파일 타임에서의 차이가 발생한다.
```

## Downcasting
- as? 와 as! 연산자를 이용해 어떤 타입의 인스턴스인지 확인할 수 있습니다.
- 특정 클래스 타입의 상수나 변수는 특정 서브클래스의 인스턴스를 참조하고 있을 수 있습니다.
```
as? 는 특정타입이라는 것이 확실한 경우에 사용합니다.
as! 는 특정타입이라는 것이 확실한 경우에 사용합니다.
as! 로 다운캐스팅을 했는데 지정한 타입이 아니라면 런타임 에러가 발생합니다.
```
```swift
let shapeRect: Shape = Rectangle()
var downcastedRect = Rectangle()

//downcastedRect = shapeRect //
//downcastedRect = shapeRect as Rectangle
// 위의 두개다 안돼 !

//downcastedRect: Rectangle = shapeRect as? Rectangle  // as? 옵셔널 타입으로 변경되는데 옵셔널 타입이 아니라서 실패
downcastedRect = shapeRect as! Rectangle  // 강제로 변화를 시도 !

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
//(value as Float) is Float   //err 자식이나 부모 클래스도 아니고 Int가 아닌데 바꾸려고 하니깐
//(value as? Float) is Float  //false nil 값을 가진다.
//(value as! Float) is Float  //err 난다.
```
