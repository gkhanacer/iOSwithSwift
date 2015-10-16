//
//  ViewController.swift
//  Music
//
//  Created by Gökhan ACER on 12/26/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer =  AVAudioPlayer()
    
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.stop()
        player.currentTime = 0
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func volumeChanged(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!)
        
        var error : NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

