//
//  FilterVC.swift
//  BeerShop
//
//  Created by Raju Gupta on 08/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
protocol DataPass {
    func filterBeer(filter : [String], isfilterActive : Bool)
}
class FilterVC: UITableViewController {

    @IBOutlet var filterTableView: UITableView!
    var beerType = [String]()
    var filterArr = [String]()
    var checked = [Bool]()
    var arrSize = 0
    var delegate:DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checked.removeAll()
        beerType = beerType.sorted(by: <)
        
        let nib = UINib(nibName: "FilterCell", bundle: nil)
        filterTableView.register(nib, forCellReuseIdentifier: "FilterCell")
        
        checked = Array(repeating: false, count: beerType.count)
    
    }
    @IBAction func onClickApply(_ sender: Any)
    {
        delegate.filterBeer(filter: filterArr, isfilterActive: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerType.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.lblBeerType.text = beerType[indexPath.row]
        if checked[indexPath.row] == false{
            cell.accessoryType = .none
        } else if checked[indexPath.row] {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            checked[indexPath.row] = false
            if let index = filterArr.firstIndex(of: beerType[indexPath.row]) {
                filterArr.remove(at: index)
            }
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            checked[indexPath.row] = true
            filterArr.append(beerType[indexPath.row])
            
        }
        
//        print(checked)
//        print(filterArr)
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

}
