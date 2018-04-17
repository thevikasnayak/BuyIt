//
//  SignupFetchCell.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 04/04/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

class SignupFetchCell: UITableViewCell
{
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellContact: UILabel!
    @IBOutlet weak var cellEmail: UILabel!
    @IBOutlet weak var cellPassword1: UILabel!
    @IBOutlet weak var cellPassword2: UILabel!
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
