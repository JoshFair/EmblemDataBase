//
//  AddingUpcomingViewController.swift
//  EmblemDataBase
//
//  Created by Fair, Josh on 2/21/17.
//  Copyright © 2017 FairEnoughLLC. All rights reserved.
//

import UIKit
import Firebase
import EmblemDataBase

struct postUpcoming {
    let name : String!
    let occasion : String!
    let date : String!
}


class AddingUpcomingViewController: UIViewController {

    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelOccasion: UITextField!
    @IBOutlet weak var labelDate: UITextField!
    @IBAction func saveUpcoming(_ sender: Any) {
        storeUpcoming()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelUpcoming(_ sender: Any) {
         self.dismiss(animated: true, completion: {});
    }
    func storeUpcoming() {
    
        //this should error check before sending over
        let name = self.labelName.text
        let date = self.labelDate.text
        let occasion = self.labelOccasion.text
    
        let post: [String : AnyObject] = ["name" : name as AnyObject,
                                          "date" : date as AnyObject,
                                          "occasion" : occasion as AnyObject,]
    
        let databaseRef = FIRDatabase.database().reference()
    
        databaseRef.child("Upcoming").childByAutoId().setValue(post)
    
        self.dismiss(animated: true, completion: {});
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
