//
//  TableViewCell.swift
//  7a_EOE
//
//  Created by Rohith Raju on 11/23/16.
//  Copyright © 2016 Rohith Raju. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var foodImg: UIImageView!
    
    @IBOutlet weak var mealType: UILabel!
    
    @IBOutlet weak var company: UILabel!
    
    @IBOutlet weak var placeEat: UILabel!
    
    @IBOutlet weak var beforeSymp: UILabel!
    
    @IBOutlet weak var afterSymp: UILabel!
    
    @IBOutlet weak var worried: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
