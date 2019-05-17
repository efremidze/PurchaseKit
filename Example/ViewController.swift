//
//  ViewController.swift
//  Example
//
//  Created by Lasha Efremidze on 5/16/19.
//  Copyright © 2019 Lasha Efremidze. All rights reserved.
//

import UIKit
import PurchaseKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PurchaseKit.shared.getInfo(products: PurchaseKit.Product.allCases) { products in }
    }
    
}
