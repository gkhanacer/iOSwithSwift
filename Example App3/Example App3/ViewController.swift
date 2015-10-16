//
//  ViewController.swift
//  Example App3
//
//  Created by Gökhan ACER on 12/29/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myText: UITextField!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var test =  "test"
        println(test)
        
        myLabel.text =  myText.text
        
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

