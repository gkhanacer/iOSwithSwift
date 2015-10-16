//
//  FirstViewController.swift
//  To Do List
//
//  Created by Gökhan ACER on 12/13/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit

var toDoList:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList.count
    }
    
    // Bu fonksiyon her bir row için ayrı ayrı çağrılır.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        //cell.text = toDoList[indexPath.row]
        
        println("fill cell")
        
        return cell
        
    }
    
    // TableView her görüntüleneceği zaman bu metod çağırılır.
    override func viewWillAppear(animated: Bool) {
        
        if var storedToDoList: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoList"){
            
            toDoList = []
            
            for  var i = 0; i < storedToDoList.count; i++ {
                toDoList.append(storedToDoList[i] as NSString)
            }

            
        }
        println("----")
        table.reloadData()
        
    }

    // Bu fonksiyon tableview tarafından çağrılırsa ve yazılımcı tarafınan tanımlanmışsa "delete" gibi menuler belirecektir.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            toDoList.removeAtIndex(indexPath.row)
            
            SecondViewController.editPersistentStorage()
            
        }
        
        table.reloadData()
        
    }

}

