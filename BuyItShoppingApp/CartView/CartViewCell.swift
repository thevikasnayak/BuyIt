//
//  CartViewCell.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 06/04/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData


class CartViewCell: UITableViewCell
{
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellQty: UILabel!
    
    
    var swiftColor = UIColor()
    
    
    
    @IBOutlet weak var btnQtyMinus: UIButton!
    @IBOutlet weak var btnQtyPlus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        swiftColor = UIColor(red: 3/255, green: 210/255, blue: 125/255, alpha: 1.0)

        
        //btnQtyPlus.layer.cornerRadius = 4
         self.btnQtyPlus.layer.cornerRadius = self.btnQtyPlus.frame.size.height/2
        btnQtyPlus.layer.borderWidth = 1.5
       btnQtyPlus.layer.borderColor = swiftColor.cgColor
        
         self.btnQtyMinus.layer.cornerRadius = self.btnQtyMinus.frame.size.height/2
        btnQtyMinus.layer.borderWidth = 1.5
         btnQtyMinus.layer.borderColor = swiftColor.cgColor
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnQtyMinus(_ sender: Any)
    {
        
    }
    
    @IBAction func btnQtyPlus(_ sender: Any)
    {
        
    }
    
    @IBAction func btnDelete(_ sender: Any)
    {
        
    }
    
    
    
    
    
    
    

}
