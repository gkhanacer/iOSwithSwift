//
//  ViewController.swift
//  Persistent Storage
//
//  Created by Gökhan ACER on 12/13/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //var myname = "Rob"
        //println(myname)
        
//        NSUserDefaults.standardUserDefaults().setObject("Gökhan", forKey: "name")
//        NSUserDefaults.standardUserDefaults().synchronize()
        println(NSUserDefaults.standardUserDefaults().objectForKey("name")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

