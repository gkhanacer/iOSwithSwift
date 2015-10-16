//
//  ViewController.swift
//  Example App
//
//  Created by Gökhan ACER on 12/8/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit  // Tüm UI nesnelerini kullanmamız için gereken kütüphane.

// Uygulamadaki tüm ekranlar UIViewController sınıfından türemiştir.
class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        println("Hello World!")
        myLabel.text =  "It worked!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

