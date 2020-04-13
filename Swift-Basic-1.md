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

# + 
