//
//  SecondViewController.swift
//  To Do List
//
//  Created by Gökhan ACER on 12/13/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var text: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(text.text)
        
        SecondViewController.editPersistentStorage()
        
        self.view.endEditing(true)
        
        text.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("viewDidLoad2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        text.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    // Static function
    class func editPersistentStorage(){
        
        let fixedtoDoList = toDoList
        
        NSUserDefaults.standardUserDefaults().setObject(fixedtoDoList, forKey: "toDoList")
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

