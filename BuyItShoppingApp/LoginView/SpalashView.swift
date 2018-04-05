//
//  SpalashView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit

class SpalashView: UIViewController

{
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var btnSignin: UIButton!
    
    var swiftColor = UIColor()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftColor = UIColor(red: 3/255, green: 210/255, blue: 125/255, alpha: 1.0)


    self.btnSignup.layer.cornerRadius=self.btnSignup.frame.size.height/2
        
    self.btnSignin.layer.cornerRadius = self.btnSignin.frame.size.height/2
        btnSignup.layer.borderWidth = 1.5
        btnSignup.layer.borderColor = swiftColor.cgColor
        
      
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSignup(_ sender: Any)
    {
        
        
    }
    
    
    @IBAction func btnSignIn(_ sender: Any)
    {
        
        
    }

}
