//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var arr:[Int] = []
for _ in 0..<100 {
    arr.append( Int(arc4random()) % 1000)
}

func biggerNumberFirst(_ a:Int,_ b:Int) ->Bool{
    return a > b
}

arr.sort(by: biggerNumberFirst(_:_:))


//------闭包  { (参数) -> 返回类型 in 函数体 }
arr.sort(by: { (_ a : Int,_ b : Int) -> Bool in
    return a > b
})


//------语法简化
arr.sort(by: { (_ a : Int,_ b : Int) -> Bool in return a > b})

//sorted 函数已经固定好了传入的类型和返回值类型 （Int,Int）->Bool 可以简化为：
arr.sort(by: { a,b in return a > b})

//return 也可以省略
arr.sort(by: { a,b in a > b})

//$0第一个参数  $1第二个参数
arr.sort(by: {$0 > $1})

//>也是一个函数
arr.sort(by: >)


//------结尾闭包 最后一个参数是函数
arr.sort(){ a,b in a > b}
//() 为空可以省略
arr.sort{ a,b in a > b}

arr.map { (number : Int) -> String in
    var number = number
    var res = ""
    repeat{
        res = String(number % 2) + res
        number /= 2
    }while number != 0
    return res
}

//----内容捕获

//300为可变 怎么办？
arr.sort { a,b in
    return abs(a-300) < abs(b-300)
}

var num = 700
arr.sort { a,b in
    return abs(a-num) < abs(b-num)
}


//----闭包和函数是引用类型
func runningMetersWithMetersPerDay(_ metersPerDay:Int)->()->Int{
    var totalMeters = 0
    return {
        totalMeters += metersPerDay
        return totalMeters
    }
}

var planA = runningMetersWithMetersPerDay(2000)
/*
 planA =
 {
    totalMeters += metersPerDay
    return totalMeters
 }
*/
planA()   //调闭包的内容
planA()
planA()

var planB = runningMetersWithMetersPerDay(5000)
planB()
planB()

var anotherPlan = planB
anotherPlan()
planB()  //引用 anotherPlan+5000 == planB+5000
