//
//  MultipleFieldCell.swift
//  BeerShop
//
//  Created by Raju Gupta on 14/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class MultipleFieldCell: UITableViewCell {

    @IBOutlet weak var lblMultipleFirst: UILabel!
    @IBOutlet weak var lblMultipleSecond: UILabel!
    @IBOutlet weak var txtMultipleFirst: UITextField!
    @IBOutlet weak var txtMultipleSecond: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtMultipleFirst.addBottomBorderWithColor(color: UIColor(red: 234/255, green: 173/255, blue: 63/255, alpha: 1), width: 1)
        txtMultipleSecond.addBottomBorderWithColor(color: UIColor(red: 234/255, green: 173/255, blue: 63/255, alpha: 1), width: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
