//: [Previous](@previous)
//: - - -
//: # Strong, Unowned, Weak
//: - - -

class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
  let teacher: Teacher
//  unowned let teacher: Teacher
//  weak var teacher: Teacher?
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher() // weak&unowned t - count 1
var student: Student? = Student(teacher: teacher!) // weak&unowned s - count 1 t - count 1
teacher?.student = student // weak&unowned only s - count 2 , t - count 1


print("\n---------- [ teacher release ] ----------\n")
//teacher?.student = nil      > Strong일때 이렇게 만들어 준다.
teacher = nil // weak&unowned t - count 0, s - count 1

print("\n---------- [ student release ] ----------\n")
student = nil // weak&unowned s - count 0





/***************************************************
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
 ***************************************************/



/*:
 ---
 ### Question
 * Strong, Weak, Unowned를 변경해가면서 직접 확인해보기
 ---
 */
class Love {
    var farewell: Farewell?
    deinit {
        print("love is gone")
    }
}

class Farewell {
    let love: Love
//    unowned let reunion: reunion
//    weak var reunion: reunion?
    init(love: Love) {
        self.love = love
    }
    deinit {
        print("farewell...")
    }
}

var love: Love? = Love()
var farewell: Farewell? = Farewell(love: love!)

love?.farewell = farewell



//: [Next](@next)
