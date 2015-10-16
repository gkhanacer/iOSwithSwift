//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Gökhan ACER on 12/21/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var goNumber = 1
    var winner = 0
    
    // 0 = empty,  1 = nought, 2 = cross
    var gameStates = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombination = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var buttonPlayAgain: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        
        goNumber = 1
        
        winner = 0
        
        gameStates = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        label.hidden = true
        
        buttonPlayAgain.alpha = 0
        
        var button : UIButton
        
        for (var i = 0; i < 9; i++) {
            
            button = view.viewWithTag(i) as UIButton
            
            button.setImage(nil, forState: .Normal)
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameStates[sender.tag] == 0 && winner == 0){
            var image = UIImage()
            
            if (goNumber % 2 == 1){
                gameStates[sender.tag] = 2
                image = UIImage(named: "cross.png")!
            }
            else{
                gameStates[sender.tag] = 1
                image = UIImage(named: "nought.png")!
            }
            
            for combination in winningCombination{
                if(gameStates[combination[0]] == gameStates[combination[1]] && gameStates[combination[1]] == gameStates[combination[2]] && gameStates[combination[0]] != 0) {
                    
                    winner = gameStates[combination[0]]
                }
            }
            
            if (winner != 0){
                label.hidden = false
                
                println("winner is ...")
                if winner == 1 {
                    label.text = "Nought has won."
                }
                else{
                    label.text = "Crosses has won."
                }
                
                UIView.animateWithDuration(1, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    self.label.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.buttonPlayAgain.alpha = 1
                })
            }
            
            goNumber++
            sender.setImage(image, forState: UIControlState.Normal)
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

    override func viewDidAppear(animated: Bool) {
        println("burada")
        label.hidden = true
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        
        buttonPlayAgain.alpha = 0
    }
}

