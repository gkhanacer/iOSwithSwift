//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Gökhan ACER on 12/9/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guess: UITextField!
    @IBOutlet weak var message: UILabel!
    
    
    @IBAction func btnGuessPressed(sender: AnyObject) {
        var number:Int = Int(arc4random_uniform(5) + 1)
        println(number)
        
        if (number == guess.text.toInt()){
            message.text = "You find it! Congratulations! :)"
        }
        else{
            message.text = "You cannot find :(   \(number)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

