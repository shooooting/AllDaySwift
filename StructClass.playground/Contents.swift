class MyReferenceClass {
    var number: Int

    init(number: Int) { // 무조건 있어야 하는 initailizer
        self.number = number
    }

    convenience init() { // 있어도 되고 없어도 되는 initailizer
        self.init(number: 10)
    }
}

let myNewClass = MyReferenceClass()
myNewClass.number = 27
print(myNewClass.number)

let myNewClass2 = myNewClass // Class는 같은 부분을 가르키고 있다고 생각하면 된다.
// myNewClass2가 MyReferenceClass()를 가르키고 있게 되는 것이다.
myNewClass.number = 30

print(myNewClass.number)
print(myNewClass2.number)

struct MyRefStruct {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    init() {
        self.init(number: 10)
    }
}

var myStruct = MyRefStruct()
print(myStruct.number)

var myStruct2 = myStruct // Class와는 다르게 Struct에서는 각각의 영역을 가지게 된다.
print(myStruct2.number)

myStruct.number = 1

print(myStruct.number)
print(myStruct2.number)
// Struct는 값타입(Value) 이기때문에 각각의 영역을 가지게 된다. 그래서 myStruct에서 값을 변경했다고 하더라도
// myStruct2에는 영향이 없다.
