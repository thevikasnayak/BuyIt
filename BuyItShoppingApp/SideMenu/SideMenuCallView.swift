//
//  SideMenuCallView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 30/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit

class SideMenuCallView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnCall(_ sender: Any)
    {
        UIApplication.shared.open(NSURL(string: "tel://9725098236")! as URL, options: [:], completionHandler: nil)
        
        
    }
    

}
