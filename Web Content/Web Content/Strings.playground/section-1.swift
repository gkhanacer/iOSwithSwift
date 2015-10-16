// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var anotherStr = "Gokhan"

var thirdStr = str + anotherStr

for c in str{
    println(c)
}

var newStr = "Test" // type is string
var newString:NSString = "Test String"   // type is NSString

// 1. NSString Generator içermez bu yüzden aşağıdaki kod çalışmaz

//for c in newString{
//    println(c)
//}


// 2. NSString'a ait bir çok fonksiyon bulunur, bu nedenle kullanırız.

var subString = newString.substringToIndex(3)
var subString2 = (newStr as NSString).substringToIndex(3) // Downcast

let str3 = "Hello, darling."
str3.substringFromIndex(advance(str3.startIndex, 4))

var endingString = newString.substringFromIndex(3)

var endingString2 =  newString.substringWithRange(NSRange(location: 3, length: 4))





str == "Hello, playground"


// 3. Contain 
// Swift'in ilk versiyonundaki containStrings çalışmıyor
newString.rangeOfString("Test")

// 4. Seperate
newString.componentsSeparatedByString(" ")

var myString = "Berlin, Paris, New York, San Francisco"
var myArray = myString.componentsSeparatedByString(",")


// 5. UP-low Case
newString.uppercaseString
newString.lowercaseString

// 6. Empty controll
var str1 = String()
str1.isEmpty
str1 += "Deneme"


var str2 = str1
str2 += " swift"
str1


// 7. Count
countElements(newStr)

// 8. Trimming
var test =  "       Lets codding!    "
var newTest = test.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())

// 9. Convert a String to NSData
let string: NSString = myString
let data = string.dataUsingEncoding(NSUTF8StringEncoding)



