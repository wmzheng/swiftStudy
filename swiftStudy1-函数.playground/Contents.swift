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

//函数式编程
func changeScore1(scores:inout [Int]) {
    for (index,score) in scores.enumerated() {
        scores[index] = Int(sqrt(Double(score))*10)
    }
}

func changeScore2(scores:inout [Int]){
    for (index,score) in scores.enumerated() {
        scores[index] = Int(Double(score)/150.0*100.0)
    }
}

var scores1 = [36,61,78,89,99]
changeScore1(scores: &scores1)

var scores2 = [88,101,124,137,150]
changeScore2(scores: &scores2)


//改进
func changeScore3(score : Int) -> Int{
    return Int(sqrt(Double(score))*10)
}
func changeScore4(score : Int) -> Int{
    return Int(Double(score)/150.0*100.0)
}

func changeScores(scores:inout [Int],changeScore : (Int)->Int){
    for (index,score) in scores.enumerated() {
        scores[index] = changeScore(score)
    }
}

var scores3 = [36,61,78,89,99]
changeScores(scores: &scores3,changeScore: changeScore3)

var scores4 = [88,101,124,137,150]
changeScores(scores: &scores4,changeScore: changeScore4)

//更简单 高阶函数
//-------map
var scores5 = [36,61,78,89,99]
scores5.map(changeScore3)

scores5
func isPassOrFail(score : Int) ->String{
    return score < 60 ? "Fail" : "Pass"
}
scores5.map(isPassOrFail)
// $0代表数组中的每一个元素
scores5.map { (score) -> String in
    return score<60 ? "Fail" : "Pass"
}
scores5.map{
    return $0<60 ? "Fail" : "Pass"
}

//-------filter
scores5
func fail(score : Int) ->Bool{
    return score < 60
}
scores5.filter(fail)
scores5.filter { (score) -> Bool in
    return score < 60
}
//$0表示数组中的每一个元素
scores5.filter{
    return $0 < 60   //返回为真的元素
}

//-------reduce
func add1(num1 : Int,num2 :Int) -> Int{
    return num1 + num2
}
scores5.reduce(0,add1)
scores5.reduce(0, +)
scores5.reduce(0,{ (score1,score2) -> Int in
    return  score1 + score2
})


let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]

func appendString(string1: String, string2: String) -> String {
    return string1 == "" ? string2 : string1 + "、" + string2
}
// reduce方法中的第一个参数是初始值
stringArray.reduce("", appendString)
stringArray.reduce("", {(string1, string2) -> String in
    return string1 == "" ? string2 : string1 + "、" + string2
})
// $0表示计算后的结果, $1表示数组中的每一个元素
stringArray.reduce("", {
    return $0 == "" ? $1 : $0 + "、" + $1
})



//返回函数类型  和 函数嵌套
func tier1MailFeeByWeight(weight:Int) -> Int{
    return 1*weight
}

func tier2MailFeeByWeight(weight:Int) -> Int{
    return 3*weight
}

func feeByUnitPrice(price:Int,weight:Int)->Int{
    func chooseMailFeeCalculationByWeight(weight:Int)-> (Int)->Int{
        return weight <= 10 ? tier1MailFeeByWeight : tier2MailFeeByWeight
    }
    
    let mailFeeByWeight = chooseMailFeeCalculationByWeight(weight: weight)
    return mailFeeByWeight(weight) + price*weight
}

feeByUnitPrice(price: 5, weight: 20)
feeByUnitPrice(price: 5, weight: 5)

