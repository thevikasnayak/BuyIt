//
//  MenuViewCell.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 07/04/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
