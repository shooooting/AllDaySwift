
class TestClass {
    let number: Int
//    let age: Int 프로퍼티는 무조건 초기화가 이루어져야 한다.
    
    init(number: Int) {
        self.number = number
    }
}

let myTestClass = TestClass(number: 33)
print(myTestClass.number)

class TestClass2 {
    let number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    convenience init() { // 다른 init을 호출해야 한다.
        self.init(number: 100) // 일부분의 프로퍼티를 초기화 할 수 있다.
    }
}

let secondTestClass = TestClass2()
print(secondTestClass.number)

class TestClass3 {
    
    let test: String
    
    init?(string: String) {
        if string.isEmpty { return nil }
        self.test = string
    }
}

let myTest3 = TestClass3(string: "안녕")
print(myTest3?.test)

let myTest4 = TestClass3(string: "")
print(myTest4?.test)

struct TestStruct {
    let name: String
    var age: Int = 10
}

let test = TestStruct(name: "준영", age: 20) // 멤버와이즈 이니셜라이즈
// var로 초기화 되어서 멤버와이즈 이니셜라이저 사용 가능
print(test.name)
print(test.age)

struct Person {
    let name: String
    let age: Int
    let hobby: String
    
    init(name: String, age: Int, hobby: String) {
        self.name = name
        self.age = age
        self.hobby = hobby
    }
}

let myName = Person(name: "준영", age: 33, hobby: "TV is my life")
print(myName.hobby)

struct directPerson {
    let name: String = "준영"
    let hobby: String = "TV"
}

let myName2 = directPerson()

print(myName2.name)
print(myName2.hobby)

enum ColorSelector: String {
    case red
    case blue = "블루" // rawValue가 "블루"?
    case black
    
    init(color: String) {
        switch color {
        case "red":
            self = .red
        case "blue":
            self = .blue
        default:
            self = .black
        }
    }
}

let color1 = ColorSelector(color: "red")
let color2 = ColorSelector(rawValue: "노랑")
let color3 = ColorSelector(rawValue: "블루")
let color4 = ColorSelector(color: "green")

struct valueStruct {
    let name: String
    let age: Int
    
    init(otherAge: Int) {
        self.name = "준영" // 사용자 이니셜라이져 정의 다른 곳에서 접근 불가
        // 이니셜라이즈의 복잡성을 낮추고 의도치 않게 사용되는 것을 방지
        self.age = otherAge
    }
}

let me = valueStruct(otherAge: 33)
print(me.age)
print(me.name)

extension valueStruct {
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let my = valueStruct(name: "준영쓰", age: 33)
