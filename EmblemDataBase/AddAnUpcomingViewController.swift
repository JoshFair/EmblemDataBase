//
//  AddAnUpcomingViewController.swift
//  EmblemDataBase
//
//  Created by Fair, Josh on 2/21/17.
//  Copyright © 2017 FairEnoughLLC. All rights reserved.
//

import UIKit
import Firebase
import EmblemDataBase


struct postUpcoming2 {
    let name : String!
    let occasion : String!
    let date : String!
}

class AddAnUpcomingViewController: UIViewController {
    
    var upcoming = [postUpcoming]()
    
    @IBAction func saveUpcoming(_ sender: Any) {
        print("save triggered")
        //storeUpcoming()
        print("save executed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //     let databaseRef = FIRDatabase.database().reference()
        //This section will be used when an event is being edited
        /*
         let databaseRef = FIRDatabase.database().reference()
         databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: {
         (snapshot) in
         
         let snapshotValue = snapshot.value as? NSDictionary
         let title = snapshotValue?["title"] as? String
         let message = snapshotValue?["message"] as? String
         
         
         self.upcoming.insert(postStruct(title: title, message: message), at: 0)
         self.tableView.reloadData()
         })
         
         post()
         
         */
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func storeUpcoming() {
     
     let name = "Name test"
     let date = "Date test"
     let occasion = "Ocassion test"
     
     let post: [String : AnyObject] = ["name" : name as AnyObject,
                                       "date" : date as AnyObject,
                                       "occasion" : occasion as AnyObject,]
     
     let databaseRef = FIRDatabase.database().reference()
     
     databaseRef.child("Upcoming").childByAutoId().setValue(post)
     
     }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
