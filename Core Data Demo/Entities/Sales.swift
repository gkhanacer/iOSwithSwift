//
//  Sales.swift
//  Core Data Demo
//
//  Created by Gökhan ACER on 1/13/15.
//  Copyright (c) 2015 Gökhan ACER. All rights reserved.
//

import Foundation
import CoreData

class Sales: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var id: NSNumber
    @NSManaged var item: String
    @NSManaged var quality: String
    @NSManaged var relationship: Contact

}
