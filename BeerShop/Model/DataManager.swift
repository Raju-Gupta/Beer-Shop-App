//
//  DataManager.swift
//  BeerShop
//
//  Created by Raju Gupta on 05/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation
import  UIKit

class DataManager
{
    static func getAllData(url: String, completion : @escaping ( [DataStore]) -> () )
    {
        let url = URL(string: url)!
        var allData = [DataStore]()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do
            {
                if let data = data
                {
                    allData = try JSONDecoder().decode([DataStore].self, from: data)
                    completion(allData)
                }
            }
            catch
            {
                
            }
            
        }.resume()
        
        
    }
}
