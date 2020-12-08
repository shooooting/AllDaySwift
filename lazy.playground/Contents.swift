import UIKit

//class User {
//    let firstName: String
//    let lastName: String
//    var fullName: String
//
//    lazy var heavyComputation: [Int] = {
//        var list: [Int] = []
//        for index in 0..<200 {
//            print(index, terminator: ",")
//            list.append(index)
//        }
//        return list
//    }()
//
//    public init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//}
//
//let user = User(firstName: "An", lastName: "Junyoung")


//class User {
//    let firstName: String
//    let lastName: String
////    var fullName: String
//
//    lazy var heavyComputation: [Int] = {
//        var list: [Int] = []
//        for index in 0..<200 {
//            print(index, terminator: ",")
//            list.append(index)
//        }
//        return list
//    }()
//
//    public init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//}
//
//let user = User(firstName: "An", lastName: "Junyoung")
//
//user.heavyComputation
//user.heavyComputation = [1, 4, 5]
//user.heavyComputation


class Person {
    var name:String
    
    lazy var greeting: () -> String = { [weak self] in
        return "Hello my name is \((self?.name))"
    } // 이렇게 클로져 자체를 담고 있는 변수의 경우 메모리 누수를 신경 써줘야 한다. [weak self]
     
  
    init(name:String){
        self.name = name
    }
}

var me = Person(name:"John")

print(me.greeting()) // Hello my name is John

me.name = "James"

print(me.greeting()) // Hello my name is John
// 또 값이 클러져 자체가 메모리에 올라가 있고 self는 계속해서 class를 참조하기 때문에 Jhon이 출력되는 것이 아니라 James가 출력이 된다.
