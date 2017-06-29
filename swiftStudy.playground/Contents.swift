//: Playground - noun: a place where people can play

import UIKit

//数据类型

/*
func test1(){
    var str = "Hello, playground"
    
    let a = 100
    let b = 200
    a+b
    
    var value = 2
    while value < 10000 {
        value = value * 2
    }
    str += "???"
    
    print(str)
    
    //强类型语言
    
    
    let website : String = "hello"
    
    //一般用Int定义就可以了，不需要用Int8等精确位数
    var imInt : Int = 80
    Int.max
    Int.min
    
    var imUInt : UInt = 80
    UInt.max
    UInt.min
    
    //_下划线分割数字
    let  bignum = 100_0000
    
    
    let imFloat : Float = 3.1415926
    let imDouble : Double = 3.1415926
    let eFloat : Float = 3.14e10
    let eFloat1 : Float = 3.14e-10
    
    //强制类型转换
    imInt + Int(imFloat)
    
    let red : CGFloat = 0.1
    UIColor(red: red, green: 0.3, blue: 0.4, alpha: 1.0)
    
    
    //Bool
    let imTure : Bool = true
    let imFalse : Bool = false
    
    //非零值不能做为真值
    if imTure {
        print("I‘m fine")
    }else{
        print("I‘m flase")
    }
    
    //元祖
    let point = (5,2)
    var httpResponse = (404 , "not found")
    var point2 : (Int,Int,Int) = (10,5,2)
    
    var (x,y) = point
    x
    y
    
    point.0
    point.1
    
    let point3 = (x:3,y:4)
    point3.x
    point3.y
    
    let point4 : (x:Int,y:Int) = (5,6)
    point4.x
    point4.y

//数据类型 首字母用大写  变量名用小写 变量名可以中文、表情符号（unicode 任意字符）
    var 名字 = "zhengweimin"
    print("我的名字是" + 名字)
    
    var 😀 = "zn"
    print(😀)
    
    let x1=1,y1=2,z1=3,b1=true
    print(x1,y1,z1,b1)
    //separator 默认空格 terminator默认回车
    print(x1,y1,z1, separator: "####")
    print(x1,y1,z1, separator: "####", terminator: "-----hello");
    print("hello")
    
    print("\(x1) * \(y1) = \(x1*y1)")

    
/*多行可以嵌套注释
     ssddd
     /*
        ssddd
     */
*/
}
test1()
*/


//运算符

/*
 func test2(){
 var a = 1
 if a == 1 {
 print("a == 1")
 }
 
 a += 1
 a -= 1
 
 var x = 10,y=3
 
 x/y
 Double(x) / Double(y)
 
 
 //比较 == != > <  >= <=    === !===    逻辑 ! && ||
 let money = 100
 let price = 70
 if money >= price  {
 print("buy it")
 }
 //三目
 var battery = 21
 let batteryColor : UIColor
 batteryColor =  (battery <= 20 ? UIColor.red : UIColor.green)//let第一次赋值
 //batteryColor = UIColor.yellow
 
 
 //区间 [a,b] a...b  [a,b) a..<b
 for i in 0...10 {
 print(i)
 }
 var cources = ["数学","语文","英语"]
 for i in 0..<cources.count{
 print(cources[i])
 }
 }
 test2()
 */

//逻辑控制

/*
func test3(){
    //顺序结构 循环结构 选择结构
    for i in stride(from: 3, through: 0, by: -1) {
        print(i)
    }
    
    for i in stride(from: 3, to: 0, by: -1) {  //不包括0  步长为-1
        print(i)
    }
    
    //逆序
    for i in (0...4).reversed() {
        print(i)
    }

//while break continue
    
    var a = 1
    repeat{
        a += 1
        print("====\(a)")
    }while a<3
    
    a = 0
    while true {
        
        a += 1
        if a == 3 {
            continue
        }
        print("====\(a)")
        if a == 7 {
            break;
        }
    }
    
//switch 所有的基础数据都可以判断  区间也可以判断  所有可能性都必须穷举出来
    var rating = "A"
    switch rating {
    case "a","A":
        print("Great")
    case "B":
        print("just so-so")
    default:
        print("error")   //不执行任何东西 可以用 break 或者 （）
    }
    
    let point1 = (5,0)
    switch point1 {
    case (let x,0):
        print("(\(x),0)")
    case (_,0):
        print("(-,0)")
    default:
        print("error")
    }
    
    let point2 = (0,0)
    switch point2 {
    case (0,0):
        print("(0,0)")
        fallthrough    //可以跳入下一个case语句
    case (_,0):
        print("(-,0)")
    default:
        print("error")
    }
    
    
    findAnswer:
    for m in 1...300 {
        for n in 1...300 {
            if m*m*m*m - n*n == 15*m*n {
                print(m,n)
                break findAnswer  //跳出整个循环
            }
        }
    }
    
//where
    let point3 = (3,3)
    switch point3 {
    case (let x,let y) where x == y:
        print("x==y")
    case let (x,y) where x == -y:
        print("x==-y")
    default:
        print("error")
    }

//if case
    let age2 = 19
    if case 10...19 = age2 {
        print("age in [10,19]")
    }
    
    if case 10...19=age2 , age2>17 {
        print("age in [10,19] and >18")
    }
    
    let vector = (4,0)
    if case (let x,0) = vector ,x>2 && x<5{
        print("x>2 && x<5")
    }
    
//for case
    for case let i in 1...100 where i%3==0 {
        print(i)
    }
    
//guard
    let money=5
    let price=6
    guard money >= price else {  //不满足 money2 >= price2 执行else
        print("money<price")
        return
    }
}
test3()
*/

//字符串

/*
func test4(){
    var str = "hello swift"
    let str2 = String("hello swift")
    let emptyStr = ""
    let emptyStr2 = String("")
    
    str2?.isEmpty
    emptyStr.isEmpty
    
    str + "!!!!"
    
    let s = "\\"
    print(s)
    let s1 = "\"hello\""
    print(s1)
    let s2 = "\"hello\"\t\"hi\""
    print(s2)
    
    for c in str.characters {
        print(c)
    }
    
    let mark : Character = "!" //字符也是用双引号 需显示声明类型 不然默认是String
    str + String(mark)
    str
    str.append(mark)
    str
    
    //都是一个字符
    let c : Character = "幕"
    let c1 : Character = "🐶"
    let c2 : Character = "\u{1F60E}"
    
    var str3 = "苹果手机"
    var str4 = "🐶🐶🐶"
    var str5 = "\u{1F60E}\u{1F60E}\u{1F60E}"
    
    
    str3.characters.count    //长度都为三
    str4.characters.count
    str5.characters.count
    
    var str6 = "café"
    var str7 = "cafe\u{0301}"
    str6.characters.count
    str7.characters.count
    
    let startIndex = str3.startIndex
    startIndex
    
    let otherIndex = str3.index(startIndex, offsetBy: 2)
    
    str3[otherIndex]
    let endIndex = str3.endIndex   //[startIndex endIndex)
    
    
    let range = startIndex..<otherIndex
    str3[range]
    
    str3.replaceSubrange(range, with: "锤子")
    str3
    str3.append("!!!!")
    str3.insert("?", at: str3.endIndex)
    str3.remove(at: str3.index(before: str3.endIndex))
    str3
    
    var str8 = "hello, swift"
    str8.uppercased()
    str8.lowercased()
    str8.capitalized
    str8.contains("hello")
    str8.hasPrefix("he")
    str8.hasSuffix("st")
    
    //as NSString 转 String
    let str9 : String = NSString(format: "one third is %.2f", 1.0/3.0) as String
}
test4()
*/

//可选类型

/*
func test5(){
//可选型  能赋值nil 空   声明为变量
    var errorCode : String? = "404"

//解包
    print(errorCode!) //errorCode 是可选型 有可能是空  所以需要解包 不安全
    if errorCode != nil {
        "The errorCode is " + errorCode!
    }else{
        "No error"
    }
    
    if let unwrappedError = errorCode {   //不需要解包
        "The errorCode is " + unwrappedError
    }
    
    if let errorCode = errorCode {   //可以用同名
        "The errorCode is " + errorCode
    }else{
        "No error"
    }
    
    var errorMessage:String? = "Not found"
    if  let errorCode = errorCode,
        let errorMessage = errorMessage{
        print("The errorCode is " + errorCode + "\nThe errorMessage is " + errorMessage)
    }
    
    if  let errorCode = errorCode,
        let errorMessage = errorMessage,
        errorCode == "404"{
        print("Page not found")
    }
    
    
    if let errorMessage = errorMessage{
        errorMessage.uppercased()
    }
    errorMessage?.uppercased()//等同于上面写法  errorMessage尝试去解包
    
    let message = errorMessage == nil ? "No error" : errorMessage
    let message1 = errorMessage ?? "No error" //等同于上面写法
    
    var error1 : (errorCode:Int,errorMessage:String?) = (404,"Not Found")
    //error1 = nil  error1不是可选类型
    
    var error2:(errorCode:Int,errorMessage:String)? = (404,"Not Found")
    error2 = nil  //error2是可选类型
    
    var error3:(errorCode:Int,errorMessage:String?)? = (404,"Not Found")

    let age = "xyz"
    let age1 = Int(age)  //Int(age) 返回值是可选型
    
//隐式可选型 不需要解包  一开始可以为nil 后面使用一定要有值
    var errorMessage1 : String!
    errorMessage1 = "not fount"
    "The errorMessage is " + errorMessage1
}
test5()
*/

//数组 有序

/*
func test6(){
    //数组里面的数据类型必须一致
    var numbers = [0,1,2,3,4,5]
    var vowels : [Character] = ["A","E","I"]
    var numbers1 : Array<Int> = [0,1,2,3,4,5]
    
    var emptyArray1 : [Int] = []
    var emptyArray3 = [Int]()
    var emptyArray4 = Array<Int>()
    
    var  allZeros = [Int](repeatElement(0, count: 5))
    

    numbers.count
    numbers.isEmpty
    numbers[2]
    numbers.first
    numbers.last
    emptyArray1.first
    
    if let firstVowel = vowels.first {
        print("the first vowel is " + String(firstVowel))
    }
    
    vowels.first
    
    numbers.min()
    vowels.max()
    
    numbers[2...4]
    
    vowels.contains("A")
    vowels.contains("B")
    
    vowels.index(of: "A")
    vowels.index(of: "B")
    
    for index in 0..<numbers.count {
        numbers[index]
    }
    
    for number in numbers {
        print(number)
    }
    
    for (i,number) in numbers.enumerated() {
        print("\(i+1):\(number)")
    }
    
    let numbers2 = [0,1,2,3,4,5]
    numbers == numbers2
    
    
    numbers.append(6)
    numbers += [7,8]
    numbers.insert(-1, at: 0)
    
    numbers.removeLast()
    numbers.removeFirst()
    numbers.remove(at: 3)
    numbers
  //  numbers.removeSubrange(0..<3)
 //   numbers.removeAll()
    
    
    numbers[3] = 3
    numbers
    numbers[4..<numbers.count] = [4,5,6]
    numbers
    numbers[4..<numbers.count] = [4]
    numbers
    
//二维数组
    var board = [[1024,16,2,0],[256,4,2,0],[64,2,0,0],[2,0,0,0]]
    var board1 : Array <Array<Int>> /*[Array<Int>] 、[[Int]] 、Array<Array<Int>>*/ = [[1024,16,2,0],[256,4,2,0],[64,2,0,0],[2,0,0,0]]
    board[0]
    board[0][0]
    board[0].append(0)
    board
    board.append([0,0,0,0])
    board += [[1,1,1,1]]
    
    var ary = [1,2,3,4] as NSArray
}
test6()
*/

//字典

/*
func test7(){
    var dict = ["swift":"雨燕；快速","python":"大蟒"]
    var dict1 : Dictionary<String,String> = ["swift":"雨燕；快速","python":"大蟒"]
    
    var emptyDic1 : [String:Int] = [:]
    var emptyDic2 : Dictionary<Int,String> = [:]
    var emptyDic3 = [String:String]()
    var emptyDic4 = Dictionary<Int,Int>()
    
    dict["swift"]
    dict["c++"]   //可选
    
    if let value = dict["swift"]{
        print(value)
    }
    
    dict.count
    dict.isEmpty
    emptyDic1.isEmpty
    
    Array(dict.keys)
    Array(dict.values)
    
    //字典是无序的
    for key in dict.keys {
        print(key)
    }
    
    for value in dict.values {
        print(value)
    }
    
    for (key,value) in dict.enumerated() {
        print("\(key):\(value)")
    }
    
    var dict2 = [1:"a",2:"b",3:"c"]
    let dict3 = [1:"a",2:"b",3:"c"]
    let dict4 = [1:"a",3:"c",2:"b"]
    dict2 == dict3  //和数组一样 是值比较
    dict2 == dict4  //无序的
    
    dict2[1] = "d"
    dict2
    dict2.updateValue("a", forKey: 1)  //返回旧值
    dict2
    dict2.updateValue("d", forKey: 4)  //不存在key 新增 旧值为空
    dict2
    
    dict2[4] = nil
    dict2
    
    dict2.removeValue(forKey: 3) //返回删除的值
    dict2
}
test7()
*/

//集合  无序 唯一 快速查找

/*
func test8(){
    //相比数组是无序、元素是不重复的会自动去掉
    var skillsOfA : Set<String> = ["swift","OC"]
    
    var emptySet1 : Set<Int> = []
    var emptySet2 = Set<Int>()
    
    var vowels = Set(["a","b","c"])
    
    skillsOfA.count
    
    let set: Set<Int> = [2,2,2,2]  //去除重复
    set.count
    
    skillsOfA.isEmpty
    emptySet1.isEmpty
    
    let e = vowels.first  //无序 随机取出一个
    vowels.contains("a")
    
    for vowel in vowels {
        print(vowel)
    }
    
    let setA : Set = [1,2,3]
    let setB : Set = [1,2,3]
    setA == setB
    
    skillsOfA.insert("CSS")
    skillsOfA.insert("swift")
    
    skillsOfA.remove("CSS")
    skillsOfA
    skillsOfA.remove("java")
    
    skillsOfA.removeAll()
    
//并集
    var set1 = Set(["swift","OC"])
    var set2 = Set(["HTML","CSS"])
    var set3 = Set(["swift","HTML"])
    var set4 = Set(["swift"])
    set1.union(set3)   //不改变set1
    set1
 //   set1.formUnion(set3) //改变set1
 //   set1

//交集
    set1.intersection(set3)
    set1
 //   set1.formIntersection(set3)
 //   set1
  
//减法  set1 减去 set1和set3的交集
    set1.subtracting(set3)
    set1
    
    //set1.subtract(set3)
    
//亦或
    set1.symmetricDifference(set3)
    set1
    
//    set1.formSymmetricDifference(set3)
//    set1
    
    set2.isSubset(of: set1)        //子集
    set4.isStrictSubset(of: set1)  //set4是set1的真子集

    
    set1.isSuperset(of: set4)  //set1是set4的超集
    set1.isStrictSuperset(of: set4) //set1是set4的真超集
    
    set1.isDisjoint(with: set2)  //是否相离 没有公共元素
}
test8()
*/
