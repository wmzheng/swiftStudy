//: Playground - noun: a place where people can play

import UIKit

func test1(){
    class Person{
        
        var firstName: String
        var lastName: String
        var career: String?
        
        init(firstName: String, lastName: String, career: String){
            self.firstName = firstName
            self.lastName = lastName
            self.career = career
        }
        
        // 如果没有初值，Class不提供默认的构造函数！
        init(firstName: String, lastName: String){
            self.firstName = firstName
            self.lastName = lastName
        }
        
        init?(fullName: String){
            guard
                let spaceIndex = fullName.range(of: " ")?.lowerBound
                else{
                    return nil
            }
            
            self.firstName = fullName.substring(to:spaceIndex)
            self.lastName = fullName.substring(from:fullName.index(after: spaceIndex))
        }
        
        func fullName() -> String{
            
            return firstName + " " + lastName
        }
        
        func changeCareer( newCareer: String ){
            self.career = newCareer
        }
    }
    
    let person1 = Person(firstName: "Alexander", lastName: "Hamilton")
    person1.fullName()
    
    if let person2 = Person(fullName: "Steve Jobs"){
        person2.firstName
        person2.lastName
    }
    
    
    
    //引用类型
    let person3 = Person(firstName: "Yubo", lastName: "Liu", career: "Developer")
    var person4 = person3
    person4.firstName = "Steven"
    person4.lastName = "Jobs"
    person4.career = "CEO"
    
    person4
    person3
    person3 === person4   //指向相同内存空间
    
    
    // 对于class,let也可以修改内部属性
    let person = Person(firstName: "Yubo", lastName: "Liu", career: "Developer")
    person.firstName = "Steve"
    person.lastName = "Jobs"
    person.career = "CEO"
    // 对于class，let是指不能指向其他空间
    //person = Person(firstName: "Steve", lastName: "Jobs", career: "CEO")
    
    person3 === person
    person !== person3
    
    
    let person5 = Person(firstName: "Yubo", lastName: "Liu", career: "Developer")
    person5.changeCareer(newCareer: "Teacher")
}
test1()


// 在struct中，改变自身的方法需要声明为mutating
func test2(){
    struct Location{
        
        var x = 0
        var y = 0
        
        mutating func goEast(){
            self.x += 1
        }
    }
    
    var location = Location()
    location.goEast()
}
test2()


// 同样，在enum中，由于也是值变量，改变自身的方法需要声明为mutating
func test3(){
    enum Switch{
        case On
        case Off
       
        mutating func click(){
            switch self{
            case .On:
                self = .Off
            case .Off:
                self = .On
            }
        }
    }
    var button = Switch.Off
    button.click()
}
test3()