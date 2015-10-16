//
//  Users.swift
//  Core Data Demo
//
//  Created by Gökhan ACER on 1/13/15.
//  Copyright (c) 2015 Gökhan ACER. All rights reserved.
//

import Foundation
import CoreData

class Users: NSManagedObject {

    @NSManaged var password: String
    @NSManaged var username: String

}
