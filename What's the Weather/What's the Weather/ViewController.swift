//
//  ViewController.swift
//  What's the Weather
//
//  Created by Gökhan ACER on 12/19/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    

    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var message: UILabel!
    
    var split = "<span class=\"phrase\">"

    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        city.text = city.text.stringByReplacingOccurrencesOfString(" ", withString: "").stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        var urlString =  "http://www.weather-forecast.com/locations/" + city.text + "/forecasts/latest"
    
        var url = NSURL(string: urlString)

        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            if ((urlContent?.containsString(self.split)) == true){
                
                var contentArray = urlContent!.componentsSeparatedByString(self.split)
                
                var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
                
                
                // Buradaki işkemin daha az zaman alması için asekron olarak çalıştırılır.
                dispatch_async(dispatch_get_main_queue()){
                    self.message.text = (newContentArray[0] as String).stringByReplacingOccurrencesOfString("&deg;", withString: "°")
                }
            }
            else{
                dispatch_async(dispatch_get_main_queue()){
                    self.message.text = "Couldn't find that city. Please, try again!"
                }
            }
            
            
        
        }
        
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

