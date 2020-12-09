struct Resolution {
    
    var width = 0
    var height = 0
    
    //    init(width: Int, height: Int) {
    //        self.width = width
    //        self.height = height
    //    }
}

let hd = Resolution(width: 1000, height: 1000)

var cinema = hd

cinema.width = 2000

print(cinema.width)
print(hd.width)
// cinema와 hd는 완전히 다른 인스턴스라는 의미이다.
// Struct는 Value Type이니깐!@!!

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
// 여기까지는 값이 west로 같다.
currentDirection.turnNorth()
print(rememberedDirection)
print(currentDirection)
// enum도 value type 이기때문에 currentDirection만 값이 바뀐다.

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = false
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(alsoTenEighty.frameRate)
print(tenEighty.frameRate)
// reference type은 내부의 값을 쉽게 변경할 수 있다.
