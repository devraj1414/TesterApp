//
//  ViewController.swift
//  TesterApp
//
//  Created by rsingh on 12/07/15.
//  Copyright (c) 2015 rsingh. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var testerArray = [Tester]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       createTesterObjectandInsert()
      

        
    }

    
    override func viewWillAppear(animated: Bool) {
          fetchAllDatafromTable()
    }
    func createTesterObjectandInsert(){
        
        var tObject = [("Apple", "India", "2010"),("Samsumng","Korea", "2000"), ("Hardddive", "Thiland", "2017"),
        ("Made In","China", "2011")]
        
        for (name, country, since) in tObject{
            Tester.insertIntoTesterTable(managedObjectContext: self.managedObjectContext!, testerName: name, testerAddress: country, testerSince: since)
            
        }
        
    }
    
    
    func fetchAllDatafromTable(){
        let fetchRequest = NSFetchRequest(entityName: "Tester")
        
        let sortDescriptor = NSSortDescriptor(key: "testerName", ascending: true)
      //  fetchRequest.sortDescriptors = [sortDescriptor]
        
        var error : NSError?
        
        let myPredicate = NSPredicate(format: "testerName == %@", "Samsumng")
      //  fetchRequest.predicate = myPredicate
        let fetchResults = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: &error) as? [Tester]
        
        
        print(object_getClass(fetchResults))
        testerArray = fetchResults!
        
        for item in testerArray{
            print("Values")
           print(item.testerName)
            print("  ")
            print(item.testerAddress)
             print("  ")
            print(item.testerSince)
            print("  ")
        }
        
        
       // print(fetchResults)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

