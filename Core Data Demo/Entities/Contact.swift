//
//  Contact.swift
//  Core Data Demo
//
//  Created by Gökhan ACER on 1/13/15.
//  Copyright (c) 2015 Gökhan ACER. All rights reserved.
//

import Foundation
import CoreData

class Contact: NSManagedObject {

    @NSManaged var adress: String
    @NSManaged var name: String
    @NSManaged var phone: String

}
