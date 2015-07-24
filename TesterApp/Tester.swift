//
//  Tester.swift
//  TesterApp
//
//  Created by rsingh on 12/07/15.
//  Copyright (c) 2015 rsingh. All rights reserved.
//

import Foundation
import CoreData

class Tester: NSManagedObject {

    @NSManaged var testerAddress: String
    @NSManaged var testerName: String
    @NSManaged var testerSince: String

    
    class func insertIntoTesterTable(managedObjectContext moCOntext :NSManagedObjectContext , testerName tName : String, testerAddress tAddress : String, testerSince since : String) -> Tester {
        
        let newTester = NSEntityDescription.insertNewObjectForEntityForName("Tester", inManagedObjectContext: moCOntext) as! Tester
        newTester.testerName = tName
        newTester.testerAddress = tAddress
        newTester.testerSince = since
        var error: NSError?
        moCOntext.save(&error)
        if  let err  = error{
            print(err.description)
        }
        else{
            print("Apple India is Saved")
        }
        
        return newTester
    }
}
