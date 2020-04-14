# Swift Basic 1


Command + Shift + Enter = 전체 실행

Shift + Enter = 커서 있는 부분까지만 실행

---

# + Print


* print() > 괄호 안의 내용을 출력
```
var num = 1 > 변수 선언
* print(숫자) > 숫자 출력
* print("숫자num") > 숫자num 출력
* print("숫자\(num)) > 숫자1 출력
* print("숫자", num) > 숫자 1 출력
* print("숫자" + String(num)) > 숫자1 출력
    ㄴ String 타입으로 변경해서 출력 가능
```

# + Comment

```
// 한 줄 주석 > Command + /
/// 한 줄 주석 + quick help markup > Command + Option + /
/* */ 여러 줄 주석

주석이 없이 쉽게 이해 할 수 있는 코드짜기!!
```

# + Semicolon (;)
```
print(); print(); print();
한줄에 여러개의 명령을 실행 시키고자 할때 ;을 붙여준다.
```

# + Constants & Variables

let(상수) : Constants 한 번 선언되면 변경이 불가능한 값

var(변수) : Variables 언제나 변경 가능한 값

---

```
* 변수 여러 개를 한번에 선언할 수 있다.
var x = 0.0, y = 0.0, z = 0.0
x = 3
y = 8
z = 4
```

```
* 다양한 언어 및 이모티콘까지 사용가능하다.
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1
    ㄴ Swift에서 사용되는 언어인 let같은 경우 ``를 이용하면 사용가능 하다.
```

```
let 한글 = "ㄱ"
    ㄴ 중복 사용은 안된다. 위의 문단에서 한글이 사용되었다.
let 공 백 = "X"
    ㄴ 띄어쓰기는 사용 안된다.
let √ = "root"
    ㄴ 수학기호도 사용되지 않는다.
let → = "arrow"
    ㄴ 화살표도 안된다.
let 369게임 = "12짝45짝..."
    ㄴ 맨 앞에 숫자로 시작하면 안된다.
```

# + Type Annotation

타입 명시 : 변수 선언 시 사용될 자료의 타입을 지정

---
```
let year: Int = 2019
    ㄴ 타입 선언과 값을 동시에 할당 할 수 있다.
let language: String
language = "Swift"
    ㄴ 타입만 선언하고 값을 나중에 할당도 가능
var red, green, blue: Double
red = 2.4444
blue = 2.4343
green = 4234
    ㄴ 동시에 선언하고 값을 각각 넣어 주는 것도 가능
```

# + Type Inference
타입 추론 : 타입을 적지 않아도 사용되는 값을 통해 변수의 타입을 추론하여 적어준다.

---
```
let name: String = "shooooting"
type(of: name)
let age: Int = 4
type(of: age)
    ㄴ type(of:) > 무슨 타입인지 출력해주는 명령어
var weight = 6.4
type(of: weight)
    ㄴ 자동으로 Double로 인식하고 출력해준다.

var isDog = true
type(of: isDog)
    ㄴ true/false 는 자동으로 Bool 로 인식
```

* Swift는 최대한 컴파일에서 오류를 찾아서 알려준다. 
* Swift 상에서는 대부분 타입추론을 사용하지만 통일성이나 프로젝트가 큰 경우 등등의 경우 타입명시를 해준다.

# + Numeric Literals
```
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger)
    ㄴ 부호가 있는 정수

let decimalInteger = 17 //10진수
let binaryInteger = 0b1001 //2진수
type(of: binaryInteger)
    ㄴ 2진수 사용시 2진수 앞에 0b를 붙여준다.

let octalInteger = 0o21 //8진수
let hexadecimalInteger = 0x11 //16진수
    ㄴ 8진수는 앞에 0o 16진수는 앞에 0x

var bigNumber = 1_000_000_000
bigNumber = 1_00000_0000_00
bigNumber = 00000_001_000_000000_00
bigNumber = 0b10000_001_01
bigNumber = 0xAB_FF_FF_00_FF
    ㄴ 숫자 사이에 _ 를 넣을 수 있다. 표기상 구분하기 좋게 넣는 것이다. 어떤 위치에도 가능하다.
```

# + Integer Type
* 8-bit : Int8, UInt8
* 16-bit : Int16, UInt16
* 32-bit : Int32, UInt32
* 64-bit : Int64, UInt64
* Platform dependent : Int, UInt (64-bit on modern devices)
    
    ㄴ 기기 마다 비트가 다르다는 것을 알아야 해요 !!

```
MemoryLayout<Int8>.size
Int8.max
Int8.min
    ㄴ Int8은 -2^7 ~ 2^7 - 1

MemoryLayout<Int16>.size
Int16.max
Int16.min
    ㄴ Int16은 (-2^15) ~ (2^15 - 1)

MemoryLayout<UInt8>.size
UInt8.max
UInt8.min
    ㄴ 음수가 없으니깐 min 값은 0 , max 값은 2^8 -1

MemoryLayout<Int32>.size
Int32.max
Int32.min
    ㄴ Int32는 -2^31 ~ 2^31 -1

MemoryLayout<Int64>.size
Int64.max
Int64.min
    ㄴ Int64는 -2^63 ~ -2^63 -1

* Int 값은 양과 음의 값을 전부 다 갖고 있으며, UInt는 양수의 값만 가지고 있다.
```
# Floating-Point Literial

```
var floatingPoint = 1.23
floatingPoint = 1.23e4 > 1.23 x 10^4
type(of: floatingPoint)

var floatingPointValue = 1.23
type(of: floatingPointValue)
    ㄴ Float, Double 두가지가 있는데 기본은 Double 이고 Float 사용하려면 명시해야 한다. bit를 적게 쓰려면 Float 사용

***************************************************
 Double - 최소 소수점 이하 15 자리수 이하의 정밀도
 Float - 최소 소수점 이하 6 자리수 이하의 정밀도
 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음
 ***************************************************
```

# Boolean Literal
```
var isBool = true
type(of: isBool)
    ㄴ Bool 타입
isBool = false

 x isBool = False
 x isBool = 1
 x isBool = 0
    ㄴ Swift에서는 소문자 true 아니면 false로만 Bool 타입이 사용된다.
```

# + String Literal
```
let str = "Hello, world!"
type(of: str)

let str1 = ""
type(of: str1)
    ㄴ "" 만 있어도 String 타입으로 인식한다.
var language: String = "Swift"
```

# + Character Literal
```

var nonCharacter = "C"
type(of: nonCharacter)
    ㄴ 무조건 기본은 String
var character: Character = "C"
type(of: character)
    ㄴ Character 타입을 사용하고 싶으면 타입 명시를 해줘야 한다.
MemoryLayout<String>.size
MemoryLayout<Character>.size
    ㄴ 두 타입 다 사이즈는 16으로 동일하다.
 x character = "string"
 x character = ' '
 x character = ""
 x character = " "
    ㄴ Character라고 명시가 되어 있으면 " " 공백은 인식하지 않기에 위 3개는 오류가 뜬다.
```

# + Typealias
*  문맥 상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶은 경우 사용
```
typealias <#type name#> = <#type expression#>

typealias Name = String
    ㄴ 이런 식으로 선언하여 주면 ...
let name: Name = "Tory"
let nameString: String = "Tory"

type(of: name)
type(of: nameString)
    ㄴ 두 타입 다 String 타입으로 사용 가능하다.
```

# + Type Conversion
```
let height = Int8(5)
    ㄴ height 가 Int8 타입이 된다.
let width = 10
    ㄴ Int 타입이 된다.

let area = height * width
print(area)
    ㄴ height는 Int8타입, width는 Int타입이 되서 실행 불가

let h = Int8(12)
let x = 10 * h
print(x)
    ㄴ h는 Int8타입인데 x는 타입이 선언되지 않아서 h의 타입을 따라가게 되어 실행되게 된다.
```

```
let num = 10
var floatNum = Float(num)
type(of: floatNum)
    ㄴ num을 10으로 Int타입이 되었어도 그 밑에 처럼 Float 타입으로 변경할 수 있다.

floatNum = 10.6

let signedInteger = Int(floatNum)
type(of: signedInteger)
    ㄴ 소수점이 있는 숫자여도 Int타입이 되면 다 버리고 10만 표시된다.

let str = String(num)
type(of: str)
    ㄴ String타입 안에 num을 넣어서 실행시킬 수 있다. 이렇게 되면 타입은 string 타입으로 나온다.
```

# + Basic Operators

## Terminology

```
let a = 123
let b = 456
let c: Int? = 789
    ㄴ Int 뒤 ? 는 옵셔너리라고 한다.
    ㄴ 값이 있을 수도 있고 없을 수도 있다.
```

```
-a 단항 연산자 : 연산자가 하나
-a 전위 표기법 : 연산자가 앞에 있는 것
c! 후기 표기법 : 연산자가 뒤에 있는 것
a + b 이항 연산자, 중위 표기법
```
```
a > 0 ? "p" : "x"
ㄴ a > 0 이게 true면 "p" false면 "x"
```
                                    
## Assignment Operators
```
var value = 0
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2
ㄴ 2로 나눈다음에 나눈 나머지의 값을 정답에 넣는다.
value += 10
value -= 5
value *= 2
value /= 2
value %= 2
ㄴ 위의 식과 동일하게 적용된다.
* value = value + 10 과  value += 10은 동일한 식으로 인식된다.
```
```
10 % 2 = 0
11 % 2 = 1
13 % 3 = 1
ㄴ 나눈 나머지의 값을 가져감
```
```
var(x, y) = (1,2)
여러개의 값을 동시에 표현 가능하다.
```

## Comparison Operators
```
비교 연산자
a == b 같냐?
a != b 다르냐?
a > b a가 b보다 크냐?
a >= b
a < b
a <= b
```

* 문자열에 대한 크기 비교는 AsciiTable을 사용한다.

참조
![asciifull](https://user-images.githubusercontent.com/62827163/79175598-19d75700-7e39-11ea-8ca7-f88b35782d06.gif)

출처 : http://www.asciitable.com/

## Logical Operators

```
Lotical and Operator
true && true > true
true && false > false
false && true > false
false && false > false
```
```
Logical Or Operator
true || true > true
true || false > true
false || true > true
false || false > false
```
```
!true > false
!false > true
```

## Range Operators
* 범위 연산자
```
0...100 > 1부터 100까지

for index in 1...5{
    print("\(index) times 5 is \(index * 5)")
}
5번 반복
```
```
0..<100 > 0부터 99까지

let names = ["Anna", "Alex", "Brian","Jack"]
let count = names.count
for i in 0..<count{
    print("Person \(i + 1) is called \(names[i])")
}
0부터 3까지 총 4번 반복 
count 값은 4
```
```
1... > 1이상의 모든 숫자
...100 > 100까지의 모든 숫자
..<100 > 99까지의 모든 숫자

number[2...] > 2이상
number[...2] > 2이하
number[..<2] > 2미만
```
```
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}
1부터 시작해서 5까지 (5번)
1 times 5 is 5
2 times 5 is 10
3 times 5 is 15
4 times 5 is 20
5 times 5 is 25
```
```
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}
print()

역으로 5부터 시작 해서 1까지 (5번)
5 times 5 is 25
4 times 5 is 20
3 times 5 is 15
2 times 5 is 10
1 times 5 is 5
```
```
for index in stride(from: 5, through: 1, by: -2) {
  print("\(index) times 5 is \(index * 5)")
}
print()

from 5 > 5부터
through 1 > 1까지
by -2 > -2씩
5,3,1 (3번)
5 times 5 is 25
3 times 5 is 15
1 times 5 is 5
```

# + Function

```
func timesTable(num: Int) {
  for i in 1...3 {
    print("\(num) * \(i) = \(num * i)")
  }
}
timesTable(num: 5)
timesTable(num: 2)

3번 반복이 된다. 
timesTable(num: 5)가 되면 
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
timesTable(num:2)
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
```
```
함수 중 인풋이 없는 타입

1.
func hello1() {
  print("Hello, world!")
}

hello1() 

2.
func hello2() -> String {
  return "Hello, world!"
}

hello2()
```
```
아웃풋이 없는 타입

1.
func say(number: Int) {
  print(number)
}

say(number: 1)

2.
func say(word: String) -> Void {
  print(word)
}

say(word: "1")

3.
func say(something: String) -> () {
  print(something)
}

say(something: "1")

인풋으로 들어온 숫자만 그대로 출력
```
```
인풋과 아웃푹 둘 다 있는 타입

1.
func addNumbers(a: Int, b: Int) -> Int {
  return a + b
}

addNumbers(a: 10, b: 20) // 30
addNumbers(a: 3, b: 5) // 8

2.
func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
  
  // return "Hello, " + person + "!" 위랑 같은 것
}

greet(person: "Anna")
greet(person: "Brian")
```
```
리턴 생략
func addTwoNumbers(a: Int, b: Int) -> Int {
  a + b
}

addTwoNumbers(a: 1, b: 2)

a + b 와 return a + b 는 같다.
```
```
* Argument Label
func someFunction(first: Int, second: Int) {
  print(first, second)
}
someFunction(first: 1, second: 2)

위의 경우처럼 이름이 하나로 쓰인 것은 상관 없지만

func speak(to name: String) {
  print(name)
}

speak(to: "Tory")

argument > to
parameter > name
* 호출 할 때랑 내부에서 사용할때 구분을 위해서 argument label을 사용한다.
```
```
Default Parameter Values

func functionWithDefault(param: Int = 12) -> Int {
  return param
}

functionWithDefault(param: 6)
  ㄴ param is 6

functionWithDefault()
  ㄴ param is 12

parameter 기본값이 지정되어 있으면 위의 경우처럼 생략 가능
```
```
Vaeiadic Parameters

func arithmeticAverage(_ numbers: Double...) -> Double { 
  var total = 0.0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticAverage(1, 2, 3)
arithmeticAverage(1, 2, 3, 4, 5)
arithmeticAverage(3, 8.25, 18.75)

함수의 이름 앞에 _ 를 활용하면 입력값에 이름을 생략할 수 있다.
```
```
Nested Function
```
```swift
func chooseFunction(plus: Bool, value: Int) -> Int {
    func plusFunction(input: Int) -> Int { input + 1 }
    func minusFunction(input: Int) -> Int { input - 1 }

  if plus {
    return plusFunction(input: value)
  } else {
    return minusFunction(input: value)
  }
}


var value = 4
chooseFunction(plus: true, value: value)
chooseFunction(plus: false, value: value)
```