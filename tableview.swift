//
//  tableview.swift
//  iamtranslator
//
//  Created by Fares Alfowzan on 9/27/17.
//  Copyright © 2017 alfowzan.dev. All rights reserved.
//

import UIKit




class favorites: UITableViewController {
    

    
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let word = GlobalVariable.favoriteArray[indexPath.row]
        cell.favoriteWordInTable.text = word
        
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return GlobalVariable.favoriteArray.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "favorites"
        return title
    }
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        //if you are currently in editing mode...
        if isEditing {
            //change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            //turn off editing mode
            setEditing(false, animated: true)
        } else {
            //change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            //Enter Editing mode
            setEditing(true, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //if the table view is asking to commit a delete command..
        if editingStyle == .delete {
            let item = GlobalVariable.favoriteArray[indexPath.row]
            
            let titel = "Delete \(item)"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: titel,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                
                //remove the item from the store
                
                GlobalVariable.favoriteArray.remove(at: GlobalVariable.favoriteArray.index(of: item)!)
                
                //Also remove that row from the table view with animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            //present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }
    
    
    
}

