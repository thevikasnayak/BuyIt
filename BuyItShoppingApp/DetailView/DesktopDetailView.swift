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
    
    
    //for data pass from collection view to this view controller
    var dataImage : UIImage!
    var dataPrice : String!
    var dataName : String!
    var dataQty : String!
    var dataCompany : String!
    var dataModel : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign this all outlet to earlier which is uppar created data passing variables
        ProductImage.image = dataImage
        ProductName.text = dataName
        ProductPrice.text = dataPrice
        ProductQty.text = dataQty
        ProductCompany.text = dataCompany
        ProductModel.text = dataModel
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func BtnPlus(_ sender: Any)
    {
        if qty < 5 {
            qty = qty + 1
        }
        self.LabelQty.text = String(qty)
    }
    
    @IBAction func BtnMinus(_ sender: Any)
    {
        if qty > 0 {
            qty = qty - 1
        }
        self.LabelQty.text = String(qty)
    }
    
    @IBAction func btnBuyNow(_ sender: Any)
    {
        
    }
    
    @IBAction func btnAddToCart(_ sender: Any)
    {
        
    }
    


}
