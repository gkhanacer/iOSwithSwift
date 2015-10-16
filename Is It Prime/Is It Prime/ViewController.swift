//
//  ViewController.swift
//  Is It Prime
//
//  Created by Gökhan ACER on 12/9/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var math = MathOperations()
    
    @IBOutlet weak var number: UITextField!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func btnIsprimePressed(sender: AnyObject) {
        
        var integer = number.text.toInt()
        
        if (integer != nil) {
            if(integer < 1){
                 message.text = "Please, enter a positive number."
            }
            else{
                if (math.isPrime(integer!)){
                    message.text = "\(integer!) is prime."
                }
                else{
                    message.text = "\(integer!) is not prime."
                }
            }
        }
        else{
            message.text = "Please, enter a number."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var d = MathOperations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

