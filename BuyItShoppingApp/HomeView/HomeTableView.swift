//
//  HomeTableView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit


class HomeTableView: UITableViewController
{
    
   
 
    
    var imageList=["Desktop","Laptop","Mobile","Camera"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        
        cell.homeImage.image = UIImage(named: imageList[indexPath.row])
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 125
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    
    
    
    }
    
    
    @IBAction func BtnMenu(_ sender: Any)
    {
        
    }
    
    
    @IBAction func btnSearch(_ sender: Any)
    {
        
    }
    
    @IBAction func btnCart(_ sender: Any)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }
    
    


}
