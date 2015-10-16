//
//  ViewController.swift
//  Web Content
//
//  Created by Gökhan ACER on 12/19/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = NSURL(string: "http:/www.stackoverflow.com")
        
        //İçerideki fonksyion task bittiğinde çalışacaktır.
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            var str =  NSString(data: data, encoding: NSUTF8StringEncoding)
            println(str)
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

