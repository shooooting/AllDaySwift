//enum Weekday {
//    case mon
//    case tue
//    case wed
//    case thu, fri, sat, sun
//}
//
//// 열거형 타입과 케이스를 모두 사용하여도 됩니다
//var day: Weekday = Weekday.mon
//
//// 타입이 명확하다면 .케이스 처럼 표현해도 무방합니다
//day = .tue
//
//print(day) // tue
//
//// switch의 비교값에 열거형 타입이 위치할 때
//// 모든 열거형 케이스를 포함한다면
//// default를 작성할 필요가 없습니다
//switch day {
//case .mon, .tue, .wed, .thu:
//    print("평일입니다")
//case .fri:
//    print("불금 파티!!")
//case .sat, .sun:
//    print("신나는 주말!!")
//}
//// 평일입니다
//
//
//enum Coffe: Int {
//    case vanilla = 1, dolce, cappuccino // vanilla가 1이라는 rawValue를 가진다.
//    case latte
//    case mocha
//    case americano
//    case dripCoffee
//}
//
//var myCoffee = Coffe.dolce
//print(myCoffee.rawValue)
//
//myCoffee = .mocha
//print(myCoffee.rawValue)
// Int 값의 경우에는 한 숫자만 선언하고 나머지 값을 선언하지 않으면 선언한 숫자 뒤로 +1된 값을 가진다.

//enum Coffee2: String {
//    case vanilla = "바닐라", dolce, cappuccino
//    case latte
//    case mocha
//    case americano
//    case dripCoffee
//}
//
//var myCoffee2 = Coffee2.vanilla
//print(myCoffee2)
//print(myCoffee2.rawValue)
//
//myCoffee2 = .mocha
//print(myCoffee2.rawValue)
//
//let coffee3 = Coffee2(rawValue: "없음")
//print(coffee3?.rawValue)
//// rawValue로 초기화한 경우 값이 없다면 nil이 출력된다.
//if let coffee: Coffee2 = Coffee2(rawValue: "mocha"){
//    print(coffee.rawValue)
//} else {
//    print("unknown")
//}
//// 옵셔널로 나오기 때문에 언랩핑을 해줘야 한다.
//
//

enum Coffee: String {
    case vanilla = "바닐라", dolce, cappuccino
    case latte
    case mocha
    case americano
    case dripCoffee
    
    func cup() -> String {
        if self.rawValue == "mocha" {
            return "mocha 싫어"
        } else {
            return "모카만 아니라면 뭐~"
        }
    }
}

let coffee = Coffee.mocha
coffee.cup()

enum School {
    case student(String, String, Int)
    case professor(String, Int)
}

let student = School.student("안준영", "안녕", 33)
let professor = School.professor("김광수", 33)

