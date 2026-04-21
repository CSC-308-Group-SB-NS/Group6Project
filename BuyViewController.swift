//
//  BuyViewController.swift
//  Group6Project
//
//  Created by Boston, Samuel T. on 4/20/26.
//

import UIKit

class BuyViewController: UIViewController {

    var carName: String?
    var carPrice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(carName ?? "No Car Name")
        print(carPrice ?? "No Car Price")
    }
}
