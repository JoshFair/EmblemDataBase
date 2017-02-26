//
//  UpcomingViewController.swift
//  EmblemDataBase
//
//  Created by Fair, Josh on 2/21/17.
//  Copyright © 2017 FairEnoughLLC. All rights reserved.
//

import UIKit
import Firebase
import EmblemDataBase


class UpcomingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var upcomingList = upcoming()
    var posts = [postStruct]()



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            print(self.posts)
            print(self.posts.count)
            print("testing the above")
        })
        print(self.posts)
        print(self.posts.count)
        print("testing the above 2")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //JF: he below two functions are for the table view on refresh
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of items
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.UpcomingNameLabel.text = posts[indexPath.row].name
        cell.UpcomingOccasionLabel.text = posts[indexPath.row].occasion
        cell.UpcomingDateLabel.text = posts[indexPath.row].date
        return cell
        
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
