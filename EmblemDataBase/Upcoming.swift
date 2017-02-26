//
//  Upcoming.swift
//  EmblemDataBase
//
//  Created by Fair, Josh on 2/21/17.
//  Copyright © 2017 FairEnoughLLC. All rights reserved.
//

import Foundation
import Firebase
import UIKit
import EmblemDataBase


class upcoming {
    //variables needed
    
    var userID: String = ""
    var upcomingID: [String] = [""]
    var upcomingOccasion: [String] = [""]
    var upcomingDate: [String] = [""]
    var upcomingName: [String] = [""]
    var upcomingImage: [UIImage] = [UIImage(named: "balloon")!]
    var upcomingStatus: Int = 1
    
    var upcomingCardID: [String] = [""]
    var upcomingECardID: [Float] = [0]
    
    var upcomingEmptyStateIsActive: Bool = false
    var numberOfUpcoming: Int = 0


func setUpcomingEmptyState() {
    print("Set Empty State Called")
    //This function will create the empty state for the first time user
    //The intent is to seed the user with 4 upcoming events to give them options
    self.upcomingName = ["Best  Friend", "Mom", "Partner", "Favorite Person"]
    self.upcomingOccasion = ["Tell them they're awesome", "Say Thanks", "Them them you love them", "Birthday"]
    self.upcomingDate = ["09/17", "09/18", "09/19","09/19"]
    self.upcomingImage = [UIImage(named: "balloon")!,UIImage(named: "balloon")!,UIImage(named: "balloon")!,UIImage(named: "balloon")! ]
    self.upcomingEmptyStateIsActive = true
    self.numberOfUpcoming = 4
    print(self.upcomingName.count)
}

func addUpcoming(_ tempName: String,_ tempOccasion: String, _ tempDate: String) {
    //This function will add a new event
    print("Add Upcoming Function Called")
    print(self.upcomingEmptyStateIsActive)
    if self.upcomingEmptyStateIsActive == true {
        self.clearUpcoming()
    }
    self.upcomingName.append(tempName)
    self.upcomingOccasion.append(tempOccasion)
    self.upcomingDate.append(tempDate)
    self.upcomingImage.append(UIImage(named: "balloon")!)
    self.numberOfUpcoming = self.upcomingName.count
}

func retrieveHistory() {
    print("Retreive History Called")
    //This function will pull all of the events from the server -
    //Need to decide if I should pivot towards PLS
    //self.numberOfUpcoming = 0
    
    //clearUpcoming()
    
    let databaseRef = FIRDatabase.database().reference()
    databaseRef.child("Upcoming").queryOrderedByKey().observe(.childAdded, with: {
        (snapshot) in
    
    let snapshotValue = snapshot.value as? NSDictionary
    
    let name = snapshotValue?["name"] as? String
    self.upcomingName.append(name!)
    
    let occasion = snapshotValue?["occasion"] as? String
    self.upcomingOccasion.append(occasion!)
        
    let date = snapshotValue?["date"] as? String
    self.upcomingDate.append(date!)
    
    let rowKey = snapshot.key
    self.upcomingID.append(rowKey)

    })
    
}


func clearUpcoming() {
    //This clears out the seeded 4 options before the user saves the
    print("Cleared Zero State Function Called")
    self.upcomingEmptyStateIsActive = false
    //resets to non-zero state
    self.upcomingName.removeAll()
    self.upcomingOccasion.removeAll()
    self.upcomingDate.removeAll()
    self.upcomingImage.removeAll()
    self.upcomingID.removeAll()
    self.numberOfUpcoming = 0
}

}
