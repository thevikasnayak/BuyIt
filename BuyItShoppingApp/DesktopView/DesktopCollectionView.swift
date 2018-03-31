//
//  DesktopCollectionView.swift
//  BuyItShoppingApp
//
//  Created by Vikas Nayak on 26/03/18.
//  Copyright © 2018 Vikas Nayak. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class DesktopCollectionView: UICollectionViewController, NSFetchedResultsControllerDelegate
{
    
    
    var frc : NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    var pc = (UIApplication.shared .delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemDesktop")
        //shor item according to names
        let sorter = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        return fetchRequest
        
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult> {
        
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        
        return frc
        
    }

    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        frc = getFRC()
        frc.delegate = self
        
        do {
            
            try frc.performFetch()
            
        }
            
        catch {
            
            print(error)
            return
            
        }
        
        self.collectionView?.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        let numberOfRows = frc.sections?[section].numberOfObjects
        return numberOfRows!
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DesktopCollectionViewCell
        
        let item = frc.object(at: indexPath) as! ItemDesktop
        
        cell.CellName.text = item.name
        cell.CellPrice.text = item.price
    
        cell.CellImage.image = UIImage(data: (item.image)! as Data)
        
        
        return cell
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        collectionView?.reloadData()
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }
    
    
    
}
