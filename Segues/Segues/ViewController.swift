//
//  ViewController.swift
//  Segues
//
//  Created by Gökhan ACER on 12/25/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

var rowCounter:Int? = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (rowCounter != nil) {
                println("Row \(rowCounter)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

