//
//  ViewController.swift
//  Navigation Bar Demo App
//
//  Created by Gökhan ACER on 12/10/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var timer = NSTimer()
    
    @IBOutlet weak var time: UILabel!
    
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        timer.invalidate()
        count = 0
        time.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func result(){
        count++
        time.text = String(count)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

