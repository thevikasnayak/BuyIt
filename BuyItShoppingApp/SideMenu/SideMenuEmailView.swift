//
//  SideMenuEmailView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 30/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import MessageUI

class SideMenuEmailView: UIViewController ,MFMailComposeViewControllerDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func btnEmail(_ sender: Any)
    {
        if MFMailComposeViewController.canSendMail() {
            
            let mailSheet : MFMailComposeViewController = MFMailComposeViewController()
            
            mailSheet.mailComposeDelegate = self
            
            mailSheet.setToRecipients(["thevikasnayak@gmail.com"])
            mailSheet.setSubject("Buyit Online Shopping")
         
            
            self.present(mailSheet, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Accounts", message: "Please log into your email account in the settings", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
   

}
