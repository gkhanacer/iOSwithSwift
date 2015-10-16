//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Gökhan ACER on 12/26/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // ------ Veritabanına bağlanma ------
        
        var appDel:AppDelegate =  UIApplication.sharedApplication().delegate as AppDelegate
        
        // context : Core Data veritabanına ulaşabilmek için kullanacağımız bir framework
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        

        
        
        
        
        
        
        // Managed Object Sınıfları il çalışmak
        
//        let entityDescription = NSEntityDescription.entityForName("Contact", inManagedObjectContext: context)
//        
//        let contact = Contact(entity: entityDescription!, insertIntoManagedObjectContext: context)
//
//        contact.name = "John Smith"
//        contact.adress = "1 Infinite Loop"
//        contact.phone = "555-564-0980"
//        
//        var errorM: NSError?
//        
//        context.save(&errorM)
//        
//        if let err = errorM {
//            // handle error
//            println(errorM)
//        }
//        
//        let requestM = NSFetchRequest()
//        requestM.entity = entityDescription
//        
//        var errorM2: NSError?
//        var resultsM = context.executeFetchRequest(requestM, error: &errorM2)
//        
//        println(resultsM)
//        
//        
//        let pred = NSPredicate(format: "(name = %@)", "John Smith")
//        requestM.predicate = pred
//        
//        resultsM = context.executeFetchRequest(requestM, error: &errorM2)
//        println(resultsM)
//        
//        
//        let resultsM2 = context.executeFetchRequest(requestM, error: &errorM2)
//        if resultsM2?.count > 1  {
//            let match = resultsM2[0] as NSManagedObject
//            let nameString = match.valueForKey("name") as String
//            let addressString = match.valueForKey("address") as String
//            let phoneString = match.valueForKey("phone") as String
//        }
//        


        
        
        
        
        
        
        
        
        // Veritabanına yeni nesne(item) eklemek için kullanılır. Buradaki "Users" entity(table) name.
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        
        
//        newUser.setValue("ayse", forKey: "username")
//        newUser.setValue("passwd4", forKey: "password")
//        
//        //Verilerin veritabanına kaydedilmesi.
//        context.save(nil)
        
        
        
        
        //  ---- Veritabanından veri çekmek -----
        
        // VT'den veri çekeceğimiz entity(table) ile fetch-request nesnesi yaratılır.
        var request = NSFetchRequest(entityName: "Users")
        
        // Bir seçenek belirlenebilir. Verileri düzgün alabilmek için buna ihtiyacımız var.
        request.returnsObjectsAsFaults = false
        
        // Predicate sorgu. not : eğer bir çok durum varsa multiple pradicte kullanılır.
        request.predicate = NSPredicate(format: "username = %@", "veli")
        
        var error:NSErrorPointer = nil;
        
        // Veritabanından istenecek olan istekler context framework sayesinde çekilir.
        var results = context.executeFetchRequest(request, error: error)
        
        //println(results)
        
        
        
        
        
        
        
        
        //  ---- Veritabanından çekilen verileri işlenebilir hale getirmek -----
        
        if results?.count > 0 {
            
            println(results)
            
            for result:AnyObject in results! {
                
                // if bloğundaki kod çalışırsa result'un bir value'su var demektir.
                // Böylelikle obtional veri yerine düzgün veriyi de elde etmiş oluyoruz.
                if let user = result.valueForKey("username") as? String {
                    if user == "veli" {
                        // Veritabanından veri silmek için de context framework'u kullanılır.
                        //context.deleteObject(result as NSManagedObject)
                        
                        // Veritabanındaki veriyi güncellemek
                        result.setValue("pass6", forKey: "password")
                    }
                    //println(user)
                }
            }
            // Yapılan tüm operasyonalar kaydedilince veritabanına yansır.
            context.save(error)
            
        } else {
            println("No result!")
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

