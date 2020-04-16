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

# repeat - while
```
while과의 차이는 repeat에서의 반복문이 실행이 되고 while 조건문을 확인하는 구조이다.
repeat에서 반복적으로 들어가는 조건을 주고 while에는 한계치를 걸어두는 것이 좋다.
repeat 아래 코드들이 실행이 되고 while 조건문을 확인하게 된다. 
이때, while 조건문이 참이되면 repeat위치로 다시 돌아가 반복하게 된다.
while 조건문이 거짓이 되면 그 아래 코드로 진행이 된다.
```
```swift
func soNumber(num: Int) {
    var i = 1
    var e = 0
    repeat {
        e += i
        i += 1
    } while i <= num
    print(e)
}
soNumber(num: 10)
```
```
* 이해
repeat의 반복문에 먼저 들어가게 되면
1 + 0 = 1 되면서 처음 e는 1이 되게 된다.
1 + 1 = 2 가 while 조건문으로 넘어가게 되고 
2 <= 10 보다 작기 때문에 다시 repeat의 반복문으로 가게 된다.
2 + 0 = 2 두번째 e는 2
2 + 1 = 3
3 <= 10 이렇게 되면서 반복하게 되다가
i가 11이 되는 순간 repeat으로 반복을 멈추고 
print(e)로 들어가게 되서 
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55가 나온다.
```
* while의 조건이 false가 되면 그 다음 코드가 실행된다.
* while의 조건이 true이면 repeat으로 돌아가면서 반복하게 된다.

# Guard
```
* 조건들을 확인하여 그 다음의 코드를 실행할지 말지를 결정 짓는다.
* guard는 항상 else와 같이 쓰인다.
* guard문의 조건식이 false 값이 나오면 else의 조건식이 실행된다.
* guard 조건식이 true면 다음 조건식이 실행된다.
```


# Optional
```
* Swift는 변수를 선언할때 non-Optional 값을 주어야 한다.
    ㄴ 변수를 선언했으면 어떤 값을 주어야 한다.
    ex) Int형으로 선언한 변수에는 무조건 정수 타입이 들어가야 한다.

```
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



