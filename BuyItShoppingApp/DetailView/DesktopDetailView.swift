//
//  DesktopDetailView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 29/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit

class DesktopDetailView: UIViewController
{
    
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductModel: UILabel!
    @IBOutlet weak var ProductCompany: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductQty: UILabel!
    
    @IBOutlet weak var LabelQty: UILabel!
    var qty = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func BtnPlus(_ sender: Any)
    {
        qty = Int(LabelQty.text!)!;
        self.LabelQty.text = String(qty + 1);
    }
    
    @IBAction func BtnMinus(_ sender: Any)
    {
        qty = Int(LabelQty.text!)!;
        self.LabelQty.text = String(qty - 1);
    }
    
    @IBAction func btnBuyNow(_ sender: Any)
    {
        
    }
    
    @IBAction func btnAddToCart(_ sender: Any)
    {
        
    }
    


}
