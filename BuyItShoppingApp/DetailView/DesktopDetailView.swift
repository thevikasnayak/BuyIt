//
//  DesktopDetailView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 29/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

class DesktopDetailView: UIViewController,UINavigationControllerDelegate
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
    
    //for db
    var item : UserCart? = nil
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //db
        
        if item == nil {
            
           // self.navigationItem.title = "Add New Data"
            
        } else {
            
            self.navigationItem.title = item?.name
            
            LabelQty.text = item?.qty
            ProductPrice.text = item?.price
            ProductName.text = item?.name
           
            ProductImage.image = UIImage(data: (item?.image)! as Data)
        }
        
        //
        
        
        
        
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
        if item == nil {
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "UserCart", in: pc)
            
            let item = UserCart(entity: entityDescription!, insertInto: pc)
            
            item.name = ProductName.text
            item.price = ProductPrice.text
            item.qty = LabelQty.text
            
            item.image = UIImagePNGRepresentation(ProductImage.image!) as Data?
        }
        else
        {
            item?.name = ProductName.text
            item?.price = ProductPrice.text
            item?.qty = LabelQty.text
            
            item?.image = UIImagePNGRepresentation(ProductImage.image!) as Data?
        }
        do
        {
            try pc.save()
        }
        catch{
            print(error)
            return
        }
    }
    
    @IBAction func btnAddToCart(_ sender: Any)
    {
        if item == nil {
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "UserCart", in: pc)
            
            let item = UserCart(entity: entityDescription!, insertInto: pc)
            
            item.name = ProductName.text
            item.price = ProductPrice.text
            item.qty = LabelQty.text
            
            item.image = UIImagePNGRepresentation(ProductImage.image!) as Data?
        }
        else
        {
            item?.name = ProductName.text
            item?.price = ProductPrice.text
            item?.qty = LabelQty.text
            
            item?.image = UIImagePNGRepresentation(ProductImage.image!) as Data?
        }
        do
        {
            try pc.save()
        }
        catch{
            print(error)
            return
    }
    


}
}
