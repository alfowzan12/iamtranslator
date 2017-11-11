//
//  historyTable.swift
//  iamtranslator
//
//  Created by Fares Alfowzan on 10/6/17.
//  Copyright © 2017 alfowzan.dev. All rights reserved.
//

import UIKit



class historyClassCell : UITableViewCell {
    
    @IBOutlet var wordInTableLabel: UITextField!
    
    
    
    
}
class historyTableView : UITableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyClassCell", for: indexPath) as! historyClassCell
        
        let wordName = GlobalVariable.recentWor[indexPath.row]
        
        cell.wordInTableLabel.text = wordName
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariable.recentWor.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "History"
    }
   
}
