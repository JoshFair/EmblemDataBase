//
//  ViewController.swift
//  EmblemDataBase
//
//  Created by Fair, Josh on 2/20/17.
//  Copyright © 2017 FairEnoughLLC. All rights reserved.
//

import UIKit
import Firebase
import EmblemDataBase






class TableViewController: UITableViewController {
    @IBOutlet weak var footerView: UIView!

    var posts = [postStruct]()
    var upcomingList = upcoming()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        upcomingList.retrieveHistory()

        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Upcoming").queryOrderedByKey().observe(.childAdded, with: {
            (snapshot) in
            
             let snapshotValue = snapshot.value as? NSDictionary
             let name = snapshotValue?["name"] as? String
             let occasion = snapshotValue?["occasion"] as? String
             let date = snapshotValue?["date"] as? String

            self.posts.insert(postStruct(name: name, occasion: occasion, date: date), at: 0)
            self.tableView.reloadData()
        })
        
 
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = posts[indexPath.row].name
        let label2 = cell?.viewWithTag(2) as! UILabel
        label2.text = posts[indexPath.row].occasion
        
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make footerview so it fill up size of the screen
        // The button is aligned to bottom of the footerview
        // using autolayout constraints
        self.tableView.tableFooterView = nil
        self.footerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.tableView.frame.size.height - self.tableView.contentSize.height - self.footerView.frame.size.height)
        self.tableView.tableFooterView = self.footerView
    }
}

