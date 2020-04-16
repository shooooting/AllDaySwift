# While
```
조건문이 참일때 무조건 반복문이 실행되는 구조를 가지고 있다.
이렇기에 항상 거짓이 되는 부분을 넣어서 무한반복이 되는 것을 막아야 한다.
```
```swift
func limit(number: Int) {
    var i = 1
    while i <= 9 {
        print("\(number) * \(i) = \(number * i))
        i += 1
    }
}
limit(number:5)
```
* 위의 구조처럼 while을 사용할때는 한계치를 둬서 사용해야 한다.
* i <= 9 이렇게 i가 9를 넘을 수 없게 한계치를 두었다.

# Optional
* Optional Binding
    ```
    if let 이나 if var 구문과 주로 같이 쓰임 (guard와도 쓰인다.)
    값이 들어가 있는지 아니면 nil 값인지 체크해 준다고 생각하면 좋다.
    ```
    ```swift
    func name (na: Sting) {
        print(na)
    }

    var yoName: String? = nil
    if let nono = yoName {
        print(nono)
    }
    ```
    ```
    * 이해
    위의 경우 출력되는 값이 없다.
    Optional Binding 이라는 것 자체가 값이 있는지 없는지 아니면 nil 값인지를 확인해 주는 것인데 nil 값이 들어 있다면 위 처럼 출력이 되지 않게 된다. 이래서 체크해 준다고 생각하면 좋을 것 같다.
    ```
    ```swift
    var height: Int? = 170
    if let landing = height {
        if landing >= 160 {
            print("그래도 160은 넘지")
        }
    } //출력 > 그래도 160은 넘지

    var weight: Int? = nil
    if let pig = weight {
        if pig == pig, pig >= 70 {
            print("살 좀 빼자")
        }
    } //출력 > x
    ```
    ```
    * 이해
    위의 경우 처럼 Optional의 값이 있는지 없는지 파악하고 값이 있다면 출력을 해주고 값이 nil 이면 출력을 해주지 않는다. 이런 과정을 Optional Binding 이라고 하며 값을 확인해 주는 단계라고 생각하면 좋겠다.
    ```



