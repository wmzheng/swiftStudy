//: Playground - noun: a place where people can play

import UIKit


//-----结构体 值类型     类  引用类型
func test1(){
    // 声明一个结构
    struct Location{
        let latitude: Double
        let longitude: Double
        
        
        // 如果不声明自定义的构造函数，结构体会创建一个包含所有参数的默认构造函数
        // 构造函数
        init(coordinateString: String){
            
            let commaIndex = coordinateString.range(of: ",")!.lowerBound
            let firstElement = coordinateString.substring(to:commaIndex)
            let secondElement = coordinateString.substring(from:coordinateString.index(after: commaIndex))
            
            // 即使是let的量，若没有初始值，在初始化的过程中仍然可以复制
            // 但如果初始化了一次以后，就不能再被赋值了
            //latitude = 0
            //longitude = 0
            
            latitude = Double(firstElement)!
            longitude = Double(secondElement)!
            
            // 也可以使用self表明是自己
            //self.latitude = Double(firstElement)!
            //self.longitude = Double(secondElement)!
        }
        
        // 写了任何一个自定义的构造函数，默认构造函数即失效
        init(latitude: Double, longitude: Double){
            
            // 使用self，表明是自己
            self.latitude = latitude
            self.longitude = longitude
        }
        
        // 可以写任意多的构造函数
        //init(placeName: String){
        //
        //}
        
        // 没有参数的构造函数
        init(){
            latitude = 0.0
            longitude = 0.0
        }
        // 也可以为属性设置初值
        // 但设置成初始属性，相应的属性应该是var
        // 如果所有的属性都有初值，则自动包含了无属性构造函数
        
        
        // 构造函数的规则
        // 必须为所有的成员变量赋值
        // 其他语言可能有默认值的概念，如对于整型是0；对于布尔值是false
        // 但是swift语言没有默认值！ - swift语言安全性的又一体现
        // 只有一个例外——可选型
        
        var placeName: String?
        // 注意可选型应该是var
        // 如果可选型是let，则必须有初值。
        let planet: String? = "The Earth"
        
        // 建议有一个包含所有属性的构造函数
        init(latitude: Double, longitude: Double, placeName: String){
            
            self.latitude = latitude
            self.longitude = longitude
            self.placeName = placeName
        }
    }
    
    
    // 初始化一个结构体
    let appleHeadQuarterLocation = Location(latitude: 37.3230, longitude: -122.0322)
    let googleHeadQuarterLocation: Location = Location(latitude: 37.4220, longitude: -122.0841)
    
    
    // 获取属性值
    appleHeadQuarterLocation.latitude
    googleHeadQuarterLocation.longitude
    
    
    // 属性值为let不可改变
    //appleHeadQuarterLocation.latitude = 0
    // 结构体为let，也不可改变
    //appleHeadQuarterLocation = googleHeadQuarterLocation
    
    // 属性含有变量var的结构体
    struct Place{
        let location: Location
        var name: String
    }
    
    // 要想修改属性，结构体变量也必须是var
    var googleHeadQuarter = Place(location: appleHeadQuarterLocation, name: "Google")
    //googleHeadQuarter.location = appleHeadQuarterLocation
    googleHeadQuarter.name = "Alphabeta"
    
    
    
    
    let location = Location(coordinateString: "37.3230,-122.0322")
    let location2 = Location(latitude: 37.3230, longitude: -122.0322)
    let nowhere = Location()
    let location3 = Location(latitude: 37.3230, longitude: -122.0322, placeName:"Apple Head Quarter")
    print(location3.latitude)
    print(location3.longitude)
    print(location3.placeName!)
    print(location3.planet)
}
test1();

// 使用Failable-Initializer,Methods-in-Struct
func test2(){
    struct Location{
        let latitude: Double
        let longitude: Double
        var placeName: String?
        
        
        init(latitude: Double, longitude: Double, placeName: String){
            self.latitude = latitude
            self.longitude = longitude
            self.placeName = placeName
        }
        
        init(latitude: Double, longitude: Double){
            self.latitude = latitude
            self.longitude = longitude
        }
        
        init(){
            latitude = 0.0
            longitude = 0.0
        }
        
        // 使用Failable-Initializer 失败返回nil
        init?(coordinateString: String){
            // 使用guard提高可读性
//            guard let commaIndex = coordinateString.range(of:",")?.lowerBound else{
//                return nil
//            }
//            
//            guard let firstElement = Double(coordinateString.substring(to:commaIndex)) else{
//                return nil
//            }
//            
//            guard let secondElement = Double(coordinateString.substring(from: coordinateString.index(after: commaIndex))) else{
//                return nil
//            }
            
            // 另一种写法，在guard中并列解包
            guard
                let commaIndex = coordinateString.range(of:",")?.lowerBound,
                let firstElement = Double(coordinateString.substring(to:commaIndex)),
                let secondElement = Double(coordinateString.substring(from: coordinateString.index(after: commaIndex)))
                else{
                    return nil
            }
            
            latitude = firstElement
            longitude = secondElement
        }
        
        //Methods-in-Struct
        func printLocation(){
            print("The Location is \(self.latitude),\(self.longitude)")
        }
        
        func isNorth() -> Bool{
            return self.latitude > 0
        }
        
        func isSouth() -> Bool{
            return !self.isNorth()
        }
        // 注意，给出两个地点的经纬度，计算两点之间的距离不是这么计算！
        // 这里只做演示用
        func distanceTo( location: Location ) -> Double{
            
            return sqrt(pow(self.latitude - location.latitude,2) + pow(self.longitude - location.latitude,2))
            
        }
    }
    
    let location = Location(coordinateString: "37.3230,-122.0322")
    let location2 = Location(coordinateString: "37.3230,-122.0322")!
    let location3 = Location(coordinateString: "37.3230&-122.0322")
    let location4 = Location(coordinateString: "apple,-122.0322")
    let location5 = Location(coordinateString: "37.3230,apple")
    let location6 = Location(coordinateString: "Hello, World!")
    
    
    
    let location7 = Location(latitude: 37.3230, longitude: -122.0322)
    location7.printLocation()
    location7.isNorth()
    location7.isSouth()
    let location8 = Location(latitude: 37.4220, longitude: -122.0841)
    location7.distanceTo(location: location8)
}
test2()

// enum也可以有方法
func test3(){
    enum Shape{
        case Square(side: Double)
        case Rectangle(width: Double, height: Double)
        case Circle(centerx: Double, centery: Double, radius: Double)
        case Point
        
        func area() -> Double{
            
            switch self {
            case let .Square(side):
                return side*side
            case let .Rectangle( width , height ):
                return width * height
            case let .Circle( _ , _ , r ):
                return M_PI*r*r
            case .Point:
                return 0
            }
        }
    }
    
    
    let square = Shape.Square(side: 10)
    let rectangle = Shape.Rectangle(width: 20, height: 30)
    let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
    let point = Shape.Point
    
    square.area()
    rectangle.area()
    circle.area()
    point.area()
}
test3()

//值类型 拷贝
func test4(){
    struct Point{
        var x = 0
        var y = 0
    }
    
    var p1 = Point()
    var p2 = p1
    
    p2.x += 1
    
    print(p2)
    print(p1)
}
test4()

func test5(){
    enum Direction{
        case North
        case South
        case East
        case West
    }
    var d1 = Direction.North
    var d2 = d1
    
    d2 = Direction.South
    
    d2
    d1
    
    
    enum Shape{
        case Square(side: Double)
        case Rectangle(width: Double, height: Double)
        case Circle(centerx: Double, centery: Double, radius: Double)
    }
    
    var square1 = Shape.Square(side: 2.0)
    var square2 = square1
    
    square2 = Shape.Square(side: 5.0)
    square2
    square1
}
test5()

// Array, Dictionary, Set 都是结构体! 值类型
// Int, Float, Double, Bool, String 都是结构体!
// 特别注意：String是结构体！
func test6(){
    var arr = [1,2,3]
    arr.count
    arr.append(4)
    
    var arr2 = arr
    arr2.insert(0, at: 0)
    
    arr
    arr2
}
test6()

// 回忆一下，我们之前使用过很多次构造函数：）
let a = Set<Int>()
let b = Int()
let c = Int(1.2)



// 回忆一下，我们之前也曾使用过Failable Initializer
let a1 = Int("2")
let b1 = Int("liuyubobobo")









