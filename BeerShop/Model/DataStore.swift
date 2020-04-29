//
//  DataManager.swift
//  BeerShop
//
//  Created by Raju Gupta on 05/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation
import  UIKit

struct DataStore : Decodable
{
    var abv : String?
    var ibu : String?
    var id : Int?
    var name : String?
    var style : String?
    var ounces : Double?
    var beerImg : UIImage = UIImage(named: "Beer")!
    var price : String = String(Int.random(in: 200..<1000))
    
    private enum beerCodingKey : String, CodingKey
    {
        case abv, ibu, id, name, style, ounces
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: beerCodingKey.self)
        
        let ABV = try container.decodeIfPresent(String.self, forKey: .abv)
        if ABV!.isEmpty
        {
            abv = "NA"
        }
        else
        {
            abv = ABV
        }
        
        let IBU = try container.decodeIfPresent(String.self, forKey: .ibu)
        if IBU!.isEmpty
        {
            ibu = "NA"
        }
        else
        {
            ibu = IBU
        }
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        style = try container.decode(String.self, forKey: .style)
        ounces = try container.decode(Double.self, forKey: .ounces)
        
        
    }
}
