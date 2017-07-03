//: Playground - noun: a place where people can play

import UIKit

//---面向对象编程

//----枚举  可以是任意类型
enum Month{
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

enum Season{
    case Spring,Summer,Autumn,Winter   //另外一种写法
}

func season (month :Month) -> Season{
    switch month {
    case .March,.April,.May:
        return .Spring
    case .June,.July,.August:
        return .Summer
    case .September,.October,.November:
        return .Autumn
    case .December,.January,.February:
        return .Winter
    }
}

//----raw value 原始值 不可变
enum Month1 : Int {   //默认从0开始
    case January = 1
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

func monthsBeforeNewYear(month : Month1) ->Int{
    return 12 - month.rawValue
}

let month = Month1.April
monthsBeforeNewYear(month: month)

if let month = Month1(rawValue: 4) {
    monthsBeforeNewYear(month: month)
}


enum Coin : Int{
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}

enum ProgrammingLanguage: String{ //String 默认是变量名
    case swift
    case ObjectiveC = "Objective-C"
    case C
    case Java
}


//-----Associate Value
enum ATMStatus{
    case Success(Int)
    case Error(String)
    case Waiting
}

var balance = 1000
func withdraw(amount : Int) ->ATMStatus{
    if balance > amount {
        balance -= amount
        return .Success(balance)
    }else{
        return .Error("Not enough money")
    }
}

let result = withdraw(amount: 1100)
switch result {
case let .Success(newBalance):
    print(newBalance)
case let .Error(error):
    print(error)
case .Waiting:
    print("Waiting")
}

switch result {
case .Success:
    print("Success")
case .Error:
    print("Error")
case .Waiting:
    print("Waiting")
}


enum Shape{
    case Square(slide : Double)
    case Rectangle(width : Double,height : Double)
    case Circle(centerx :Double,centery :Double,radius :Double)
    case Point
}

let square = Shape.Square(slide: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
let point = Shape.Point

func area(shape :Shape)->Double{
    switch shape {
    case let .Square(slide):
        return slide*slide
    case let .Rectangle(width,height):
        return width*height
    case let .Circle(_,_,r):
        return M_PI*r*r
    case .Point:
        return 0
    }
}

area(shape: square)
area(shape: rectangle)
area(shape: circle)
area(shape: point)


//可选型 本质是枚举变量  Optional<String> == String?
var website : Optional<String> = Optional.some("www.baidu.com")
website = .none
//可以直接赋值
website = "www.imooc.com"
website = nil


//枚举递归 indirect也可以加在头部
enum ArithmeticExpression{
    case Number(Int)
    indirect case Addition(ArithmeticExpression,ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression,ArithmeticExpression)
}

//(5+4)*2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiplication(sum,two)

func evaluate(expression:ArithmeticExpression)->Int{
    switch expression {
    case let .Number(number):
        return number
    case let .Addition(left,right):
        return evaluate(expression:left)+evaluate(expression:right)
    case let .Multiplication(left,right):
        return evaluate(expression:left)*evaluate(expression:right)
    }
}

evaluate(expression: product)
