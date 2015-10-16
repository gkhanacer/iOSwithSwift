//
//  ViewController.swift
//  Shake and Swipe
//
//  Created by Gökhan ACER on 12/26/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    var files = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRigth = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRigth.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRigth)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
    }

    func swiped(gesture : UIGestureRecognizer) {
    
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                println("Right")
            case UISwipeGestureRecognizerDirection.Up:
                println("Up")

            default:
                println("Default")
            }
        }
    }
    
    
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            
            println("User shook their device!")
            
            var randomNumber = Int(arc4random_uniform(UInt32(files.count)))
            
            //var fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("sounds/pig", ofType: "mp3")!)
            var fileLocation:NSURL = NSBundle.mainBundle().URLForResource("sounds/"+files[randomNumber], withExtension: "mp3")!
            
            var error:NSError? = nil
            
            //player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
            player = AVAudioPlayer(contentsOfURL: fileLocation, error: &error)
            
            player.play()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

