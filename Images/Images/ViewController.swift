//
//  ViewController.swift
//  Images
//
//  Created by Gökhan ACER on 12/20/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alien: UIImageView!

    var timer = NSTimer()
    
    var counter = 1
    
    @IBAction func change(sender: AnyObject) {
        
        counter++
        
        if(counter == 6){
            counter = 1
        }
        alien.image = UIImage(named: "frame\(counter).png")

    }
    
    override func viewDidLoad() {
        println("viewDidLoad")
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view, typically from a nib.
    }

    func result() {
        counter++
        
        if(counter == 6){
            counter = 1
        }
        alien.image = UIImage(named: "frame\(counter).png")
    }
    
    
    override func didReceiveMemoryWarning() {
        println("didReceiveMemoryWarning")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews()")
        
        //alien.center = CGPoint(x: alien.center.x - 400, y: alien.center.y - 200)
        //alien.alpha  = 0
        alien.frame = CGRectMake(100, 20, 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear")
        
        UIView.animateWithDuration(3, animations: {
            //self.alien.center =  CGPoint(x: self.alien.center.x + 400, y: self.alien.center.y + 200)
            
            //self.alien.alpha = 1
            self.alien.frame = CGRectMake(100, 20, 100, 200)
        })
    }
    
}

