//
//  TableViewCell.swift
//  iamtranslator
//
//  Created by Fares Alfowzan on 10/3/17.
//  Copyright © 2017 alfowzan.dev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var favoriteWordInTable: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
