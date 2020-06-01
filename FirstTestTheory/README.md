# FirstTestTheory

##  1. Array, Set, Dictionary 의 차이점에 대해 설명하고 예시 코드 작성
- Array(배열)
```
1. Index 기반으로 값이 저장된 순서를 가지고 있음
2. 중복 허용
ex)
let a: [Int] = [1, 2, 4, 6]
```

- Set(집합)
```
1. Array와 비슷한 형태를 가지고 있음
2. 같은 타입을 가진 연관된 값들의 모음  
3. 순서가 없고, 중복이 허용되지 않음
```

- Dictionary
```
1. Key - Value 쌍으로 이루어져 있음
2. 무조건 둘다 있어야 함
3. Key값은 중복 허용되지 않음, Value값은 중복 허용.
4. 순서 없음
```

##  2. Value Type, Reference Type 에 대한 예시와 그 차이점에 대해 설명

- Value types (값 타입)
```
1. Struct(구조체), enum, tuple 이 해당된다.
2. 원본의 데이터를 건드리지 않는다.
3. 메모리의 Stack 영역에 데이터가 저장된다.
```
```swift
struct C { var number = 10 }
var x = C()
var y = x
x.number = 20
print("\(x.number), \(y.number)") // "20, 10

```
```
위의 경우 값 타입의 struct(구조체)를 활용하였기때문에 원본 데이터는 그대로 유지되므로 직접적으로 바꾼 값인 y.number는 20이 출력이 되지만 그렇지 않은 값인 x.number는 10이 출력된다.
```

- reference Type (참조 타입)
```
1. 대표적으로 Class가 있지만 Class만 해당하는 것은 아니다.
2. 메모리의 Stack 영역에 데이터가 담긴 주소를 가르키는 방향이 저장되고 Heap 영역에 실제 데이터가 저장된다.
3. 원본 데이터를 건드릴 수 있다.
```
```swift
class C { var number = 10 }
var x = C()
var y = x
x.number = 20
print("\(x.number), \(y.number)")  // "20, 20"
```
```
위의 계산식에서는 reference Type (참조 타입)의 Class를 활용하였기 때문에 원본 데이터에 접근이 가능하여 x.number뿐만 아니라 다른 값들도 20으로 나온다.
```

## Application의 LifeCycle의 각 상태에 대해 설명

- Not running
```
아직 실행되지 않은 상태, 시스템 또는 사용자에 의해 앱이 종료된 상태
```
- Inactive
```
Active 상태로 전환전 잠깐 거치는 단계, 앱이 실행중이지만 앱의 상태전환 등의 이유로 이벤트를 일시적으로 받지 못하는 상태
```
- Active
```
앱이 실행 중이며 이벤트를 정상적으로 수신 받을 수 있는 상태
```
- Background
```
백그라운드에서 앱이 실행 중인 상태 또는 Suspended 상태로 넘어가기전 잠시 머무는 단계
```
- Suspended
```
앱이 백그라운드에 있으며 메모리는 남아있지만 어떤 코드도 수행하지 않고 있는 상태
+ 메모리가 부족해지면 시스템에 의해 강제 종료될 수 있다.
```

##  ViewController LifeCycle의 각 상태에 대해 설명
```
viewDidLoad - view에 대한 로드가 완료된 시점에 호출
viewWillAppear - view를 화면에 나타내기 직전에 호출
viewDidAppear - view가 화면에 나타난 직후 호출
viewWillDisappear - view가 화면에서 사라지기 진적에 호출
viewDidDisappear - view가 화면에서 사라진 직후 호출
```

## 다음 4개의 키워드 (continue, break, return, fallthrough)가 쓰이는 위치와 역할에 대해 각각 설명
- continue
```
반복문 내에서 사용, 현재 수행하던 작업을 중단하고 다음 반복자를 수행
```
```swift
for i in 1...10 {
    if i < 9 {
        continue
    }
    print("\(i)는 9랑 같거나 크다.")
}
//9는 9랑 같거나 크다.
//10는 9랑 같거나 크다.
```
```
continue 사용 예제인데 9보다 작거나 같은 값은 if구문 안으로 들어가지만 continue를 만나서 다음 반복문을 수행하게 되면서 다시 for문으로 돌아간다. if 구문에 해당하지않는 9와 10은 print에 적힌 문구가 출력된다.
```
- break
```
반복문, Switch 문에서 사용된다. 수행하던 작업을 중단하고 즉시 그 구문에서 빠져 나온다.
```
```swift
for i in 1...5 {
    if i > 2 {
        break
    }
    print("\(i)는 9랑 같거나 크다.")
}
//1는 9랑 같거나 크다.
//2는 9랑 같거나 크다.
```
```
1과 2는 if문의 조건에 해당하지 않아서 print의 구문이 출력되지만 if문의 조건이 성립하게 되는 3이 if문 안으로 들어가게 되면 break가 되서 for문을 종료 시킨다.
```
- return
```
함수(func)의 실행을 종료할 때에는 return 구문을 사용합니다. return 구문이 실행되면 이후의 코드가 남아있더라도 더 이상 진행하지 않은 채로 함수가 종료됩니다. 함수의 종료와 함께 반환해야 하는 값이 있으면 그것을 반환하는 역할도 합니다.
```
```swift
func divide(base: Int) {
    guard base != 0 else {
        print("연산할 수 없습니다.")
        return
    }
    
    let result = 100 / base
    print(result)
}
divide(base: 0)
//연산할 수 없습니다.
```
```
0을 넣으면 gaurd문에 걸리게 되어 연산할 수 없습니다.가 print 되게 되는데 이때 return을 적어주면 그 값을 반환해 준다.
```
- fallthrough
```
switch 내에서 사용,
```