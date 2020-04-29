//
//  AddressVC.swift
//  BeerShop
//
//  Created by Raju Gupta on 14/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

enum cellSection: Int
{
    case Personal = 0, Address
}
class AddressVC: UIViewController
{
    @IBOutlet weak var addTableView: UITableView!
    
    var arrSection = ["Personal Details","Address Details"]
    var arrRow = [["First Name | Last Name","Mobile"], ["House No | Apartment","Street Detail","City | Area","Pincode"]]
    
    override func viewDidLoad(){
        super.viewDidLoad()

        let nib = UINib(nibName: "SingleFieldCell", bundle: nil)
        addTableView.register(nib, forCellReuseIdentifier: "SingleFieldCell")
        
        let nib2 = UINib(nibName: "MultipleFieldCell", bundle: nil)
        addTableView.register(nib2, forCellReuseIdentifier: "MultipleFieldCell")
        
    }
    
}

extension AddressVC : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sect = cellSection(rawValue: section)
        {
            switch sect {
            case .Personal:
                return 2
            case .Address:
                return 4
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 80))

        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        //label.font = UIFont(name: "Avenir-Next", size: 17)
        label.textColor = UIColor(red: 234/255, green: 173/255, blue: 64/255, alpha: 1)

        if section == 0
        {
            label.text = "Personal Details"
            
        }
        else
        {
            label.text = "Address Details"
        }
        
        headerView.addSubview(label)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if let sect = cellSection(rawValue: indexPath.section)
        {
            switch sect {
            case .Personal:
                if indexPath.row == 0
                {
                    let multiCell = tableView.dequeueReusableCell(withIdentifier: "MultipleFieldCell", for: indexPath) as! MultipleFieldCell
                    multiCell.lblMultipleFirst.text = "First Name"
                    multiCell.lblMultipleSecond.text = "Last Name"
                    return multiCell
                }
                else
                {
                    let singleCell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldCell", for: indexPath) as! SingleFieldCell
                    singleCell.lblSingle.text = "Mobile"
                    return singleCell
                }
            case .Address:
                if indexPath.row == 0
                {
                    let multiCell = tableView.dequeueReusableCell(withIdentifier: "MultipleFieldCell", for: indexPath) as! MultipleFieldCell
                    multiCell.lblMultipleFirst.text = "House No"
                    multiCell.lblMultipleSecond.text = "Apartment"
                    return multiCell
                }
                else if indexPath.row == 1
                {
                    let singleCell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldCell", for: indexPath) as! SingleFieldCell
                    singleCell.lblSingle.text = "Street Detail"
                    return singleCell
                }
                else if indexPath.row == 2
                {
                    let multiCell = tableView.dequeueReusableCell(withIdentifier: "MultipleFieldCell", for: indexPath) as! MultipleFieldCell
                    multiCell.lblMultipleFirst.text = "City"
                    multiCell.lblMultipleSecond.text = "Area"
                    return multiCell
                }
                else
                {
                    let singleCell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldCell", for: indexPath) as! SingleFieldCell
                    singleCell.lblSingle.text = "Pincode"
                    return singleCell
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}
