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

    override func viewDidLoad() {
        super.viewDidLoad()

    self.btnSignup.layer.cornerRadius=self.btnSignup.frame.size.height/2
        
    self.btnSignin.layer.cornerRadius=self.btnSignin.frame.size.height/2
       
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
