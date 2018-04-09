//
//  DesktopSaveView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

class DesktopSaveView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
    
{
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var txtModel: UITextField!
    @IBOutlet weak var txtProductName: UITextField!
    @IBOutlet weak var txtCompanyName: UITextField!
    @IBOutlet weak var txtProductQty: UITextField!
    @IBOutlet weak var txtProductPrice: UITextField!
    
    
    var item : ItemDesktop? = nil
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad()
    {
        super.viewDidLoad()

        if item == nil {
            
           // self.navigationItem.title = "Add New Data"
            
        } else {
            
            self.navigationItem.title = item?.name
            
            txtCompanyName.text = item?.company
            txtProductQty.text = item?.qty
            txtProductPrice.text = item?.price
            txtModel.text = item?.model
            txtProductName.text = item?.name
            
            imageView.image = UIImage(data: (item?.image)! as Data)
            
        }
        
       
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        
        self.resignFirstResponder()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCamera(_ sender: Any)
    {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnLibrary(_ sender: Any)
    {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func btnSave(_ sender: Any)
    {
        
        if item == nil {
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "ItemDesktop", in: pc)
            
            let item = ItemDesktop(entity: entityDescription!, insertInto: pc)
            
            item.company = txtCompanyName.text
            item.model = txtModel.text
            item.name = txtProductName.text
            item.price = txtProductPrice.text
            item.qty = txtProductQty.text
            
            item.image = UIImagePNGRepresentation(imageView.image!) as Data?
            
        } else {
            
            item?.company = txtCompanyName.text
            item?.model = txtModel.text
            item?.name = txtProductName.text
            item?.price = txtProductPrice.text
            item?.qty = txtProductQty.text
            
            item?.image = UIImagePNGRepresentation(imageView.image!) as Data?
        }
        do
        {
            try pc.save()
        }
        catch {
            
            print(error)
            return
        }
        navigationController!.popViewController(animated: true)
        
        
    }
    
    
        
    
}







