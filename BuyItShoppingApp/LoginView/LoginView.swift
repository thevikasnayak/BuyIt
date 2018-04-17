
//  LoginView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

class LoginView: UIViewController, UITextFieldDelegate,NSFetchedResultsControllerDelegate
{
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnSignin: UIButton!
    
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //login
    var result = NSArray()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPassword.delegate = self
        txtUserName.delegate = self
        
        self.btnSignin.layer.cornerRadius=self.btnSignin.layer.frame.size.height/2
        self.btnGoogle.layer.cornerRadius=self.btnGoogle.layer.frame.size.height/2
        self.btnFacebook.layer.cornerRadius=self.btnFacebook.layer.frame.size.height/2
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 300, 0)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if txtUserName.isFirstResponder {
            //do validation
            txtPassword.becomeFirstResponder()
        } else {
            txtPassword.resignFirstResponder()
            
        }
        return false
    }
    
    @IBAction func didTapScreen(_ sender: Any) {
        if txtUserName.isFirstResponder {
            txtUserName.resignFirstResponder()
        } else if txtPassword.isFirstResponder {
            txtPassword.resignFirstResponder()
        }
    }
    
    @IBAction func btnForgotPassword(_ sender: Any)
    {
        
    }
    
    
    @IBAction func btnLogin(_ sender: Any)
    {
        //msg box
        if txtUserName.text == "" && txtPassword.text == ""
        {
            let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        else
            
        {

        self.CheckForUserNameAndPasswordMatch(username : txtUserName.text! as String, password : txtPassword.text! as String)
    }
    }
    
    
    @IBAction func btnGoogle(_ sender: Any)
    {
        
    }
    
    
    @IBAction func btnFacebook(_ sender: Any)
    {
        
    }
    
    
    func CheckForUserNameAndPasswordMatch( username: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserRegistration")
        
        let predicate = NSPredicate(format: "email = %@", username)
        
        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let objectentity = result.firstObject as! UserRegistration
                
                if objectentity.email == username && objectentity.password1 == password
                {
                    print("Login Succesfully")
                    let lv : HomeTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeTableViewController
                    self.navigationController?.pushViewController(lv, animated: true)
                    
                }
                else
                {
                    print("Wrong username or password !!!")
                    
                }
            }
        }
            
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
        
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

