//
//  Extension.swift
//  BeerShop
//
//  Created by Raju Gupta on 12/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation
import UIKit
import FCAlertView

extension UIViewController
{
    func showErrorAlertWithTitle(_ title:String?, message:String) {
         let alert = FCAlertView()
        alert.colorScheme = UIColor(red: 182/255, green: 50/255, blue: 38/255, alpha: 0.9)
        alert.showAlert(withTitle: title, withSubtitle: message, withCustomImage: #imageLiteral(resourceName: "Error"), withDoneButtonTitle: nil, andButtons: nil)
        
    }
    
    
    func showAlertWithForSucess(_ title:String?,message: String){
        
        let alert = FCAlertView()
        alert.colorScheme = UIColor(red: 25/255, green: 180/255, blue: 145/255, alpha: 0.9)
        alert.showAlert(withTitle: title, withSubtitle: message, withCustomImage: #imageLiteral(resourceName: "Success"), withDoneButtonTitle: nil, andButtons: nil)
    }
}

extension UIView
{
    func setDropShadow()
    {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
}

