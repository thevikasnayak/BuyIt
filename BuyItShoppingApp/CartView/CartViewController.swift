//
//  CartViewController.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 06/04/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

class CartViewController: UIViewController,NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource

{
    var total = 0
    var swiftColor = UIColor()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var checkoutButton: UIButton!
    
    
    //db
    var fetchecResult : NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //db
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCart")
       let sorter = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        return fetchRequest
        
    }
    
    //db
    func getCartData() -> NSFetchedResultsController<NSFetchRequestResult> {
        
        fetchecResult = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchecResult
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        swiftColor = UIColor(red: 3/255, green: 210/255, blue: 125/255, alpha: 1.0)
        
        
         //self.totalLabel.layer.cornerRadius = self.btnSignin.frame.size.height/2
        self.totalLabel.layer.borderWidth = 1.5
        self.totalLabel.layer.borderColor = swiftColor.cgColor
        
        
        fetchecResult = getCartData()
        fetchecResult.delegate = self
        
        do {
            
            try fetchecResult.performFetch()
            
        }
            
        catch {
            
            print(error)
            return
            
        }
        
        self.tableView.reloadData()
        
        for object  in fetchecResult.fetchedObjects! {
            let item = object as! UserCart
            total = total + Int(item.price!)!
            
            totalLabel.text = String(total)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

   
     func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let numberOfRows = fetchecResult.sections?[section].numberOfObjects
        return numberOfRows!
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CartViewCell
        
        let item = fetchecResult.object(at: indexPath) as! UserCart
        
        cell.cellName.text = item.name
        cell.cellQty.text = item.qty
        cell.cellPrice.text = item.price
        cell.cellImage.image = UIImage(data: (item.image)! as Data)
        
        return cell
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.reloadData()
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
