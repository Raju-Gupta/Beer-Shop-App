//
//  CartTableC.swift
//  BeerShop
//
//  Created by Raju Gupta on 12/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class CartTableC: UITableViewController {
    
    @IBOutlet var cartTableView: UITableView!
    @IBOutlet weak var barBtnCheckOut: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CartCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartCell")
        
        isCartEmpty()
        
    }
    
    func isCartEmpty()
    {
        if CartData.shareCart.cart.isEmpty
        {
            barBtnCheckOut.isEnabled = false
            barBtnCheckOut.image = UIImage()
        }
        else
        {
            barBtnCheckOut.isEnabled = true
            barBtnCheckOut.image = UIImage(systemName: "cart.fill.badge.plus")
        }
    }
    
    
    
    @IBAction func onclickCheckOut(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(identifier: "AddressVC") as! AddressVC
        if CartData.shareCart.cart.isEmpty
        {
            showErrorAlertWithTitle("Empty Cart", message: "Your cart is empty.")
        }
        else
        {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CartData.shareCart.cart.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.imgBeerImage.image = CartData.shareCart.cart[indexPath.row].beerImg
        cell.lblBeerCount.text = CartData.shareCart.cart[indexPath.row].beerQnt
        cell.lblBeerName.text = CartData.shareCart.cart[indexPath.row].beerName
        cell.lblBeerPrice.text = "$ \(CartData.shareCart.cart[indexPath.row].beerTotalPrice!)"
        cell.lblBeerStyle.text = CartData.shareCart.cart[indexPath.row].beerStyle
        
        cell.btnAdd.tag = indexPath.row
        cell.btnSub.tag = indexPath.row
        
        cell.btnAdd.addTarget(self, action: #selector(AddBeers(_:)), for: .touchUpInside)
        cell.btnSub.addTarget(self, action: #selector(removeBeers(_:)), for: .touchUpInside)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    @objc func AddBeers(_ sender : UIButton)
    {
        var count = Int(CartData.shareCart.cart[sender.tag].beerQnt!)!
        let price = Int(CartData.shareCart.cart[sender.tag].beerPrice!)
        
        if count < 10
        {
            count = count + 1
            CartData.shareCart.cart[sender.tag].beerQnt = "\(count)"
            CartData.shareCart.cart[sender.tag].beerTotalPrice = "\(price! * count)"
            
        }
        cartTableView.reloadData()
    }
    
    @objc func removeBeers(_ sender : UIButton)
    {
        var count = Int(CartData.shareCart.cart[sender.tag].beerQnt!)!
        let price = Int(CartData.shareCart.cart[sender.tag].beerPrice!)!
        
        if count > 0
        {
            count = count - 1
            CartData.shareCart.cart[sender.tag].beerQnt = "\(count)"
            CartData.shareCart.cart[sender.tag].beerTotalPrice = "\(price * count)"
            
        }
        else if count == 0
        {
            CartData.shareCart.cart.remove(at: sender.tag)
        }
        cartTableView.reloadData()
    }

    

}
