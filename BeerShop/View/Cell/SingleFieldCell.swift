//
//  SingleFieldCell.swift
//  BeerShop
//
//  Created by Raju Gupta on 14/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class SingleFieldCell: UITableViewCell {

    
    @IBOutlet weak var lblSingle: UILabel!
    @IBOutlet weak var txtSingle: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtSingle.addBottomBorderWithColor(color: UIColor(red: 234/255, green: 173/255, blue: 63/255, alpha: 1), width: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
