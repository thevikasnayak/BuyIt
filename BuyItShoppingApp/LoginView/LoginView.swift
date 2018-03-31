//
//  LoginView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit

class LoginView: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnSignin: UIButton!
    
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    

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
        
    }
    
    
    @IBAction func btnGoogle(_ sender: Any)
    {
        
    }
    
    
    @IBAction func btnFacebook(_ sender: Any)
    {
        
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
