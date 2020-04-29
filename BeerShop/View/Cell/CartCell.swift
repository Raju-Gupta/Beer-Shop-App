//
//  CartCell.swift
//  BeerShop
//
//  Created by Raju Gupta on 12/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgBeerImage: UIImageView!
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblBeerStyle: UILabel!
    @IBOutlet weak var lblBeerPrice: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnSub: UIButton!
    @IBOutlet weak var lblBeerCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.layer.cornerRadius = 10
        viewContainer.layer.masksToBounds = true
        
        btnAdd.layer.borderWidth = 1
        btnAdd.layer.borderColor = UIColor(red: 234.0/255.0, green: 173.0/255.0, blue: 64.0/255.0, alpha: 1).cgColor
        btnAdd.layer.cornerRadius = 5
        btnAdd.layer.masksToBounds = true
        
        btnSub.layer.borderWidth = 1
        btnSub.layer.borderColor = UIColor(red: 234.0/255.0, green: 173.0/255.0, blue: 64.0/255.0, alpha: 1).cgColor
        btnSub.layer.cornerRadius = 5
        btnSub.layer.masksToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
