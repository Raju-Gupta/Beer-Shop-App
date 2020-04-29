//
//  HomeTableCell.swift
//  BeerShop
//
//  Created by Raju Gupta on 04/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblBeerStyle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblABV: UILabel!
    @IBOutlet weak var imgBeerImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewContainer.layer.cornerRadius = 10
        viewContainer.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
