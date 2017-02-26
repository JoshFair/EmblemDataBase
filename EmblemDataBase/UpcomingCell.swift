//
//  UpcomingCell.swift
//  EmblemDataBase
//
//  Created by Fair, Josh on 2/21/17.
//  Copyright © 2017 FairEnoughLLC. All rights reserved.
//


import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var UpcomingNameLabel: UILabel!
    @IBOutlet weak var UpcomingOccasionLabel: UILabel!
    @IBOutlet weak var UpcomingDateLabel: UILabel!
    @IBOutlet weak var UpcomingTypeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

