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
    var carImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = carName
        costLabel.text = carPrice
        descriptionLabel.text = "This is a general description of the car, including its model and some information about it!"
        
        imageView.image = carImage
    }
}
