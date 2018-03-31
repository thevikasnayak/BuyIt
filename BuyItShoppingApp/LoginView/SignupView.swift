//
//  SignupView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

class SignupView: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var txtfullname: UITextField!
    
    @IBOutlet weak var txtContactno: UITextField!
    
    @IBOutlet weak var txtEmailid: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
     @IBOutlet weak var txtPassword2: UITextField!
    
    
    
    
    var item : UserRegistration? = nil
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //scrollView
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 300, 0)
        
        
        
        if item == nil {
            
            self.navigationItem.title = "Add New Data"
            
        } else {
            
            self.navigationItem.title = item?.fullName
            
        
            txtEmailid.text = item?.email
            txtContactno.text = item?.contact
            txtPassword.text = item?.password1
            txtPassword2.text = item?.password2
            imageProfile.image = UIImage(data: (item?.image)! as Data)
            
        }
        
            
        }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        
        self.resignFirstResponder()
    }
        
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageProfile.image = image
            
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
    
    
    @IBAction func btnSignup(_ sender: Any)
    {
        if item == nil {
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "UserRegistration", in: pc)
            
            let item = UserRegistration(entity: entityDescription!, insertInto: pc)
            
            item.fullName = txtfullname.text
            item.contact = txtContactno.text
            item.email = txtEmailid.text
            item.password1 = txtPassword.text
            item.password2 = txtPassword2.text
            
            item.image = UIImagePNGRepresentation(imageProfile.image!) as Data?
            
        } else {
            
            item?.fullName = txtfullname.text
            item?.contact = txtContactno.text
            item?.email = txtEmailid.text
            item?.password1 = txtPassword.text
            item?.password2 = txtPassword2.text
            
            item?.image = UIImagePNGRepresentation(imageProfile.image!) as Data?
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




    

