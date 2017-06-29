//: Playground - noun: a place where people can play

import UIKit

func sayHello(name: String?) -> String{
    return "Hello " + ( name ?? "Guest")
}

var nickName : String = "weimin"
sayHello(name: nickName)

func printHello(){
    print("Hello")
}
printHello()


//元祖返回值
func findMaxAndMin(numbers:[Int]) -> (max:Int,min:Int)?{
    guard numbers.count > 0 else {
        return nil
    }

    var minValue = numbers[0]
    var maxValue = numbers[0]
    for number in numbers {
        minValue = minValue < number ? minValue : number
        maxValue = maxValue > number ? maxValue : number
    }
    return (maxValue,minValue)
}

var scores : [Int]? = [202,1321,234,552,23,111]
scores = scores ?? []
if let result = findMaxAndMin(numbers: scores!) {
    result.max
    result.min
}

//外部参数名 _省略参数名
func sayHello(to name: String?) -> String{
    return "Hello " + ( name ?? "Guest")
}
sayHello(to: "will")

//参数默认值 不需要放在最后，最好放后面
func sayHello(to name: String = "world") -> String{
    return "Hello " + name
}

sayHello()


//变长参数
func mean (numbers : Double ...) ->Double{
    var sum :Double = 0
    
    for number in numbers {
        sum += number
    }
    return sum / Double(numbers.count)
}
mean(numbers: 2)
mean(numbers: 2,3)
mean(numbers: 2,3,5,7,8)


//默认参数前面是let 常量  变成可变,参数不变
func toBinary(num: Int) -> String{
    var num = num
    var res = ""
    repeat{
        res = String(num % 2) + res
        num /= 2
    }while num != 0
    return res
}

var num = 12
toBinary(num: num)
num


//改变参数值
func swapTwoInts(_ a: inout Int,_ b: inout Int){
//    let t:Int = a
//    a = b
//    b = t
    
    (a,b) = (b,a)
}
var x :Int = 1
var y :Int = 2
swapTwoInts(&x,&y)
x
y

func initArray( arr: inout [Int] ,by value:Int){
    for i in 0..<arr.count {
        arr[i] = value
    }
}
var arr = [1,2,3,4]
initArray(arr: &arr, by: 0)


//函数变量
func add(a:Int,b:Int)->Int{
    return a+b
}
let anotherAdd = add
let anotherAdd1:(Int,Int)->Int = add

func sayHello1(){
    print("hello")
}
let anotherSayHello = sayHello1
let anotherSayHello1:()->() = sayHello1
let anotherSayHello2:()->Void = sayHello1

var arr1 = [Int]()
for _ in 0..<100 {
    arr1.append(Int(arc4random()) % 1000)
}
arr1.sorted()
arr1
arr1.sort()
arr1

func biggerNumberFirst(a:Int,b:Int)->Bool{
    return a>b
}
arr1.sort(by: biggerNumberFirst) 
arr1
