import UIKit

//class TestClass {
//
//    init() {
//        print("init")
//    }
//
//    deinit {
//        print("deinit")
//    }
//}
//
//var testClass: TestClass? = TestClass()
//testClass = nil
// 강한 참조가 된 부분에 nil 을 넣어주면 메모리가 해제가 된다.

//class TestClass{
//    var testClass: TestClass? = nil
//    init() {
//        print("init")
//    }
//    deinit {
//        print("deinit")
//    }
//}
//
//var testClass1: TestClass? = TestClass()
//var testClass2: TestClass? = TestClass()
//
//testClass1?.testClass = testClass2
//testClass2?.testClass = testClass1
//
//testClass1 = nil
//testClass2 = nil
// 강한 참조가 각각 2개씩 있다. 각 하나는 TestClass를 강한 참조를 하고 있으면 서로를 가르키며 강한 참조하고 있다.
// 각각 강한 참조를 하나씩은 nil 값을 넣어서 강한 참조를 없애 주었다.
// 하지만 서로를 강한 참조하고 있는 부분은 해제되지 않았다. 이렇게 되면 Retain Cycle이 발생하고 메모리 누수가 발생한다.
// 여기서 더 문제는 위의 코드에서는 강한 참조 부분에 접근할 수 없다는 점이다.

//class TestClass{
//
//    weak var testClass: TestClass?  // 이제 이 참조는 약한 참조이다!
//
//    init() {
//        print("init")
//    }
//
//    deinit {
//        print("deinit")
//    }
//}
//
//var testClass1: TestClass? = TestClass()
//var testClass2: TestClass? = TestClass()
//
//testClass1?.testClass = testClass2
//testClass2?.testClass = testClass1
//
//testClass1 = nil
//testClass2 = nil
// weak을 사용해서 약한 참조를 만들어주면 reference count가 올라가지 않게 된다. reference는 참조할 수 있지만!!
// 이렇게 되면 메모리가 해제가 된다.


//protocol ChildViewControllerProtocol: AnyObject {
//    // important functions
//}
//
//class ParentViewController: UIViewController, ChildViewControllerProtocol {
//
//    let childViewController = ChildViewController()
//
//    func prepareChildViewController(){
//        childViewController.delegate = self
//    }
//
//}
//
//class ChildViewController: UIViewController {
//    var delegate: ChildViewControllerProtocol?
//}
// delegate를 사용할 때 강한 참조가 발생하는 것을 볼 수 있다.
// 강한 참조는 delegate를 선언할 때 weak으로 선언해 줌으로써 Retain Cycle을 예방할 수 있다.

//class TestClass {
//
//    let aConstant = 5
//
//    init() {
//        print("init")
//        let aBlock = {
//            print(self.aConstant)
//        }
//    }
//    deinit {
//        print("deinit")
//    }
//}
//
//var testClass: TestClass? = TestClass()
//testClass = nil
// 클로져도 Retain Cycle이 발생할 수 있는 요소를 가지고 있다.
// 클로져 내부에 self TestClass 객체를 강한 참조를 한다.
// 하지만 위에서 처럼 메소드 안에 클로져가 배치가 된다면 메소드가 return이 되면 메모리에서 해제가 된다.
// 위와 같이 클로져를 메소드 내에서 사용하는 경우가 UIView.animateWithDuration 이다.

class TestClass {
    let aConstant = 5
    
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
    func doSomething(){
        UIView.animate(withDuration: 5){
            let aConstant = self.aConstant
            
            // fancy animation ... .
        }
    }
}

var testClass: TestClass? = TestClass()
testClass?.doSomething()
testClass = nil
