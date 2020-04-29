//
//  BeerDetailVC.swift
//  BeerShop
//
//  Created by Raju Gupta on 08/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class BeerDetailVC: UIViewController {
    
    @IBOutlet weak var barBtnCart: UIBarButtonItem!
    @IBOutlet weak var imgBeerImage: UIImageView!
    @IBOutlet weak var lblBeerPrice: UILabel!
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblBeerCan: UILabel!
    @IBOutlet weak var lblBeerABV: UILabel!
    @IBOutlet weak var lblBeerIBU: UILabel!
    @IBOutlet weak var lblBeerStyle: UILabel!
    @IBOutlet weak var btnUp: UIButton!
    @IBOutlet weak var btnDown: UIButton!
    @IBOutlet weak var lblBeerCount: UILabel!
    var Id : Int?
    var count = 0
    var totalPrice = 0
    
    var beerDetails = [DataStore]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDataSetUp()
    }
    
    func viewDataSetUp()
    {
        imgBeerImage.image = beerDetails[0].beerImg
        lblBeerPrice.text = "$ \(beerDetails[0].price)"
        lblBeerName.text = beerDetails[0].name
        lblBeerCan.text = "\(beerDetails[0].ounces ?? 00.0)"
        lblBeerABV.text = beerDetails[0].abv ?? "NA"
        lblBeerIBU.text = beerDetails[0].ibu ?? "00"
        lblBeerStyle.text = beerDetails[0].style ?? ""
        lblBeerCount.text = "\(count)"
        Id = beerDetails[0].id
        
    }
    
    @IBAction func onClickUp(_ sender: Any)
    {
        if count < 10
        {
            count = count+1
            lblBeerCount.text = "\(count)"
        }
        
    }
    
    @IBAction func onClickDown(_ sender: Any)
    {
        if count > 0
        {
            count = count-1
            lblBeerCount.text = "\(count)"
        }
    }
    
    @IBAction func onClickAddToCart(_ sender: Any)
    {
        totalPrice = count * Int(beerDetails[0].price)!
        
        if count > 0
        {
            if let index = CartData.shareCart.cart.firstIndex(where: {$0.beerId == Id})
            {
                CartData.shareCart.cart[index].beerQnt = "\(count)"
                CartData.shareCart.cart[index].beerTotalPrice = "\(totalPrice)"
            }
            else
            {
                CartData.shareCart.cart.append(CartModel(beerId: Id, beerImg: beerDetails[0].beerImg, beerName: beerDetails[0].name, beerStyle: beerDetails[0].style, beerQnt: "\(count)", beerPrice: beerDetails[0].price, beerTotalPrice: "\(totalPrice)"))
                showAlertWithForSucess("Success", message: "Beers added successfully")
                
            }
        }
    }
    
    @IBAction func onClickCart(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(identifier: "CartTableC") as! CartTableC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
