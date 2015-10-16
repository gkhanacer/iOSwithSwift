//
//  TableViewController.swift
//  Maps
//
//  Created by Gökhan ACER on 12/26/14.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

var activePlace = 0
var places = [Dictionary<String,String>()]

class TableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("table controller viewDidLoad")
        // Swift dictioanary nesnesi yaratırken bir tane boş elemanı içine koyuyor. Bu yüzden o silinir.
        if places.count == 1 {
            places.removeAtIndex(0)
        }
        
         if places.count == 0 {
            places.append(["name":"Taj Mahal", "lat":"27.175301", "long":"78.042134"])
        }
        
        
        //println(places)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return places.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = places[indexPath.row]["name"]
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        activePlace = indexPath.row
        
        self.performSegueWithIdentifier("findPlace", sender: indexPath )
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addPlace" {
            activePlace = -1
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
    
        println("table controller viewWillDisappear")
        
        self.navigationController?.navigationBarHidden = true
    }
    

}
