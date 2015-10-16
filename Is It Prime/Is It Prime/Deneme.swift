//
//  File.swift
//  Is It Prime
//
//  Created by Gökhan ACER on 12/10/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import Foundation

class MathOperations {
    
    func sayHello(personName : String) ->String{
        let greeting = "Hello, " + personName + "!"
        return greeting
    }
    
    func isPrime(number : Int) ->Bool{
        //var isPrime =  true
        
        if (number == 1){
            return false
        }
        else{
            for var i = 2 ; i < number ; i++ {
                if number % i == 0{
                    return false
                }
            }
        }
        
        return true
    }
    
}

